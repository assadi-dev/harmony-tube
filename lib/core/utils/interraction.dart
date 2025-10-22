import 'package:vibration/vibration.dart';

const int amplitude = 100;
const int duration = 100;

void vibrate() async {
  if (await Vibration.hasVibrator()) {
    Vibration.vibrate(amplitude: amplitude, duration: duration);
  }
}
