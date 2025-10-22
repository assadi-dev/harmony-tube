String formatDurationFromSeconds(int totalSeconds) {
  final duration = Duration(seconds: totalSeconds);

  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  final minutesStr = minutes.toString().padLeft(2, '0');
  final secondsStr = seconds.toString().padLeft(2, '0');

  if (hours > 0) {
    return '$hours:$minutesStr:$secondsStr'; // ex: 2:03:07
  } else {
    return '$minutesStr:$secondsStr'; // ex: 03:07
  }
}

String formatDurationFromMilliseconds(int milliseconds) {
  final duration = Duration(milliseconds: milliseconds);

  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  final minutesStr = minutes.toString().padLeft(2, '0');
  final secondsStr = seconds.toString().padLeft(2, '0');

  if (hours > 0) {
    return '$hours:$minutesStr:$secondsStr'; // ex: 1:03:07
  } else {
    return '$minutesStr:$secondsStr'; // ex: 03:07
  }
}