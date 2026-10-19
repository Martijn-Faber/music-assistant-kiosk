1. Scan QR-code on phone
2. Copy adress to PC that you're running the emulator on and open it in the browser
3. Open the port in the Android emulator using adb (adb forward tcp:xxx tcp:xxx)
4. Replace the hostname with localhost
5. Replace the redirected hostname (local ip) with the external hostname
6. Close the window
7. Replace the redirected hostname (local ip) again  with external hostname
8. The emulator should be authenticated