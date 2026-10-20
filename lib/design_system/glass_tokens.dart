import 'package:flutter/material.dart';

abstract final class GlassTokens {
  // Shared motion scale for interface transitions. Keep interaction feedback
  // quick, content changes measured, and page/artwork moves unhurried.
  static const motionQuick = Duration(milliseconds: 120);
  static const motionStandard = Duration(milliseconds: 220);
  static const motionEmphasized = Duration(milliseconds: 360);
  static const motionNavigation = Duration(milliseconds: 550);
  static const motionAmbient = Duration(milliseconds: 650);

  // Component motion tokens alias the shared scale. Components should use
  // these names so their timing can be tuned without creating new durations.
  static const pagerPageTransitionDuration = motionNavigation;
  static const pagerControlTransitionDuration = motionQuick;
  static const idleControlTransitionDuration = motionEmphasized;
  static const onboardingStepTransitionDuration = motionEmphasized;
  static const onboardingLayoutTransitionDuration = motionEmphasized;
  static const onboardingContentTransitionDuration = motionStandard;
  static const artworkBackdropTransitionDuration = motionAmbient;
  static const queueArtworkTransitionDuration = motionAmbient;
  static const nowPlayingContentTransitionDuration = motionStandard;
  static const pageIndicatorTransitionDuration = motionStandard;
  static const scrollFadeTransitionDuration = motionStandard;
  static const queueSheetSnapDuration = motionStandard;
  static const queueSheetExpandDuration = motionEmphasized;
  static const queueAutoScrollDuration = motionNavigation;
  static const queueItemMoveDuration = motionStandard;
  static const queueItemRemoveDuration = motionQuick;
  static const queueItemReorderDuration = motionEmphasized;
  static const queueItemDismissDuration = motionStandard;
  static const queueItemResizeDuration = motionQuick;
  static const playerVolumeSheetTransitionDuration = motionStandard;
  static const playerVolumeContentTransitionDuration = motionStandard;
  static const playerVolumeFeedbackEnterDuration = motionStandard;
  static const playerVolumeFeedbackExitDuration = motionEmphasized;
  static const snackbarResizeDuration = motionStandard;
  static const snackbarTransitionDuration = motionEmphasized;

  static const background = Color(0xFF101819);
  static const error = Color(0xFFFFA39B);
  static const errorText = Color(0xFFFFC0BA);
  static const errorSurface = Color(0x26FF776F);
  static const errorBorder = Color(0x66FF938A);
  static const textPrimary = Color(0xFFF1F4EA);
  static const textSecondary = Color(0xFFD8E0DB);
  static const textMuted = Color(0xFFCBD4D0);
  static const surfaceTint = Color(0x22303840);
  static const surfaceTintSubtle = Color(0x1A303840);
  static const surfaceTintDisabled = Color(0xCC303840);
  static const border = Color(0x66FFFFFF);
  static const selected = Color(0x33FFFFFF);
  static const iconPrimary = Color(0xFFFFFFFF);
  static const iconSecondary = Color(0xB3FFFFFF);
  static const iconDisabled = Color(0xFF87918C);
  static const interactionOverlay = Color(0x1AFFFFFF);
  static const disabledOpacity = 0.38;

  // Icon button component tokens alias shared semantic tokens above.
  static const iconButtonPrimaryIconEnabled = textPrimary;
  static const iconButtonPrimaryIconSelected = iconPrimary;
  static const iconButtonPrimaryIconDisabled = textSecondary;
  static const iconButtonPrimaryContainerEnabled = surfaceTint;
  static const iconButtonPrimaryContainerSelected = selected;
  static const iconButtonPrimaryContainerDisabled = surfaceTintDisabled;
  static const iconButtonPrimarySize = iconButtonSecondarySize;
  static const iconButtonPrimaryInteractionOverlay = interactionOverlay;
  static const iconButtonProgressIndicatorSize = 18.0;
  static const iconButtonProgressIndicatorStrokeWidth = 2.0;

  static const iconButtonSecondaryIconEnabled = iconSecondary;
  static const iconButtonSecondaryIconSelected = iconPrimary;
  static const iconButtonSecondaryIconDisabled = iconDisabled;
  static const iconButtonSecondaryContainerEnabled = Colors.transparent;
  static const iconButtonSecondaryContainerSelected = selected;
  static const iconButtonSecondaryContainerDisabled = surfaceTintDisabled;
  static const iconButtonSecondaryInteractionOverlay = interactionOverlay;
  static const iconButtonSecondarySize = 44.0;

  static const radiusSmall = 12.0;
  static const radiusMedium = 16.0;
  static const radiusLarge = 18.0;
  static const cardRadius = radiusLarge;

  // Shared type scale. Use these in TextStyles rather than feature-local
  // numeric sizes so hierarchy can be tuned across the app in one place.
  static const fontSize9 = 9.0;
  static const fontSize10 = 10.0;
  static const fontSize11 = 11.0;
  static const fontSize12 = 12.0;
  static const fontSize13 = 13.0;
  static const fontSize14 = 14.0;
  static const fontSize15 = 15.0;
  static const fontSize16 = 16.0;
  static const fontSize18 = 18.0;
  static const fontSize20 = 20.0;
  static const fontSize22 = 22.0;
  static const fontSize23 = 23.0;
  static const fontSize26 = 26.0;
  static const fontSize28 = 28.0;
  static const fontSizeClock = 88.0;

  // Shared icon scale for controls and supporting UI.
  static const iconSizeXs = 14.0;
  static const iconSizeS = 16.0;
  static const iconSizeM = 20.0;
  static const iconSizeL = 28.0;
  static const iconSizeXl = 42.0;

  static const weightRegular = FontWeight.w400;
  static const weightMedium = FontWeight.w500;
  static const weightSemiBold = FontWeight.w600;
  static const weightBold = FontWeight.w700;
  static const weightHeavy = FontWeight.w800;

  static const trackingTight = -0.5;
  static const trackingButton = 0.5;
  static const trackingLabel = 0.8;
  static const trackingWide = 1.1;
}
