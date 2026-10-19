package com.example.app

import android.media.VolumeProvider
import android.media.session.MediaSession
import android.media.session.PlaybackState
import android.content.Context
import android.animation.Animator
import android.animation.AnimatorListenerAdapter
import android.animation.ValueAnimator
import android.net.wifi.WifiManager
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.view.KeyEvent
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
	private companion object {
		const val MAX_DIMMED_BRIGHTNESS = 0.35f
		const val DIM_BRIGHTNESS_FACTOR = 0.65f
		const val BRIGHTNESS_ANIMATION_DURATION_MS = 800L
	}

	private var mediaSession: MediaSession? = null
	private var hardwareButtonChannel: MethodChannel? = null
	private var multicastLock: WifiManager.MulticastLock? = null
	private var brightnessAnimator: ValueAnimator? = null

	override fun onWindowFocusChanged(hasFocus: Boolean) {
		super.onWindowFocusChanged(hasFocus)
		if (hasFocus) {
			window.decorView.systemUiVisibility = (
				android.view.View.SYSTEM_UI_FLAG_FULLSCREEN
					or android.view.View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
					or android.view.View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
					or android.view.View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
					or android.view.View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
					or android.view.View.SYSTEM_UI_FLAG_LAYOUT_STABLE
			)
		}
	}

	override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
		super.configureFlutterEngine(flutterEngine)
		val volumeButtonChannel = MethodChannel(
			flutterEngine.dartExecutor.binaryMessenger,
			"com.example.app/volume_buttons",
		)
		hardwareButtonChannel = volumeButtonChannel
		MethodChannel(
			flutterEngine.dartExecutor.binaryMessenger,
			"com.example.app/network_discovery",
		).setMethodCallHandler { call, result ->
			when (call.method) {
				"acquireMulticastLock" -> {
					val wifiManager = applicationContext.getSystemService(
						Context.WIFI_SERVICE,
					) as WifiManager
					val lock = multicastLock ?: wifiManager.createMulticastLock(
						"MusicAssistantDiscovery",
					).also {
							it.setReferenceCounted(false)
							multicastLock = it
						}
					if (!lock.isHeld) lock.acquire()
					result.success(null)
				}
				"releaseMulticastLock" -> {
					multicastLock?.let { if (it.isHeld) it.release() }
					result.success(null)
				}
				else -> result.notImplemented()
			}
		}
		MethodChannel(
			flutterEngine.dartExecutor.binaryMessenger,
			"com.example.app/screen_brightness",
		).setMethodCallHandler { call, result ->
			when (call.method) {
				"setDimmed" -> {
					val dimmed = call.argument<Boolean>("dimmed") ?: false
					animateScreenBrightness(dimmed)
					result.success(null)
				}
				else -> result.notImplemented()
			}
		}

		val mainHandler = Handler(Looper.getMainLooper())
		val volumeProvider = object : VolumeProvider(
			VolumeProvider.VOLUME_CONTROL_RELATIVE,
			100,
			50,
		) {
			override fun onAdjustVolume(direction: Int) {
				val method = when {
					direction > 0 -> "volumeUp"
					direction < 0 -> "volumeDown"
					else -> return
				}
				mainHandler.post { volumeButtonChannel.invokeMethod(method, null) }
			}
		}

		val session = MediaSession(this, "MusicAssistantVolume")
		session.setPlaybackToRemote(volumeProvider)
		session.setPlaybackState(
			PlaybackState.Builder()
				.setActions(PlaybackState.ACTION_PLAY_PAUSE)
				.setState(PlaybackState.STATE_PAUSED, 0, 0f)
				.build(),
		)
		volumeButtonChannel.setMethodCallHandler { call, result ->
            if (call.method == "setEnabled") {
                val isEnabled = call.arguments as? Boolean ?: false
                session.isActive = isEnabled
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
		mediaSession = session
	}

	private fun animateScreenBrightness(dimmed: Boolean) {
		brightnessAnimator?.cancel()
		val attributes = window.attributes
		val systemBrightness = (
			Settings.System.getInt(
				contentResolver,
				Settings.System.SCREEN_BRIGHTNESS,
				255,
			) / 255f
		).coerceIn(0.01f, 1f)
		val start = if (attributes.screenBrightness >= 0f) {
			attributes.screenBrightness
		} else {
			systemBrightness
		}
		val target = if (dimmed) {
			minOf(MAX_DIMMED_BRIGHTNESS, systemBrightness * DIM_BRIGHTNESS_FACTOR)
		} else {
			systemBrightness
		}
		val animator = ValueAnimator.ofFloat(start, target).apply {
			duration = BRIGHTNESS_ANIMATION_DURATION_MS
			addUpdateListener { animation ->
				val brightness = animation.animatedValue as Float
				window.attributes = window.attributes.apply {
					screenBrightness = brightness
				}
			}
			addListener(object : AnimatorListenerAdapter() {
				override fun onAnimationEnd(animation: Animator) {
					if (brightnessAnimator !== this@apply) return
					if (!dimmed) {
						window.attributes = window.attributes.apply {
							screenBrightness =
								WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE
						}
					}
					brightnessAnimator = null
				}
			})
		}
		brightnessAnimator = animator
		animator.start()
	}

	override fun dispatchKeyEvent(event: KeyEvent): Boolean {
		if (mediaSession?.isActive == true) {
			val volumeAction = when (event.keyCode) {
				KeyEvent.KEYCODE_VOLUME_UP -> "volumeUp"
				KeyEvent.KEYCODE_VOLUME_DOWN -> "volumeDown"
				else -> null
			}
			if (volumeAction != null) {
				if (event.action == KeyEvent.ACTION_DOWN) {
					hardwareButtonChannel?.invokeMethod(volumeAction, null)
				}
				if (event.action == KeyEvent.ACTION_DOWN || event.action == KeyEvent.ACTION_UP) {
					return true
				}
			}
		}

		val playPauseKey = event.keyCode == KeyEvent.KEYCODE_ASSIST ||
			event.keyCode == KeyEvent.KEYCODE_VOICE_ASSIST ||
			event.keyCode == KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE ||
			event.keyCode == KeyEvent.KEYCODE_HEADSETHOOK ||
			event.keyCode == KeyEvent.KEYCODE_MUTE ||
			event.keyCode == KeyEvent.KEYCODE_VOLUME_MUTE
		if (playPauseKey && mediaSession?.isActive == true) {
			if (event.action == KeyEvent.ACTION_DOWN && event.repeatCount == 0) {
				hardwareButtonChannel?.invokeMethod("togglePlayback", null)
			}
			if (event.action == KeyEvent.ACTION_DOWN || event.action == KeyEvent.ACTION_UP) {
				return true
			}
		}
		return super.dispatchKeyEvent(event)
	}

	override fun onDestroy() {
		brightnessAnimator?.cancel()
		brightnessAnimator = null
		multicastLock?.let { if (it.isHeld) it.release() }
		multicastLock = null
		mediaSession?.isActive = false
		mediaSession?.release()
		mediaSession = null
		super.onDestroy()
	}
}
