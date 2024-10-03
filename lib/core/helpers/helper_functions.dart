import 'dart:async';
import 'dart:io';

class HelperFunctions {
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static timerFunction(
      {int countdownTimeInSeconds = 60,
      Duration? timerDuration,
      required bool dispose,
      required void Function(int time, bool isActive) onChange}) {
    Timer.periodic(timerDuration ?? const Duration(seconds: 1), (timer) {
      if (dispose) timer.cancel();
      if (countdownTimeInSeconds > 0) {
        countdownTimeInSeconds -= 1;
        onChange(countdownTimeInSeconds, timer.isActive);
      } else if (countdownTimeInSeconds <= 0) {
        timer.cancel();
        onChange(00, timer.isActive);
      }
    });
  }

  static String formatTimeToDigit({required int time, int digitCount = 2}) {
    return time.toString().padLeft(digitCount, '0');
  }


}
