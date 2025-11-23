import 'package:vibration/vibration.dart';

const int amplitude = 100;
const int duration = 50;

void vibrate() async {
  if (await Vibration.hasVibrator()) {
    Vibration.vibrate(amplitude: amplitude, duration: duration);
  }
}


/**
 * Interrompt l'exécution pendant un nombre de secondes spécifié.
 *
 * Cette fonction asynchrone utilise `Future.delayed` pour créer une pause
 * dans le flux d'exécution sans bloquer le thread principal de l'application.
 *
 * @param delay Le nombre de secondes à attendre.

 * ### Exemple d'utilisation :
 * ```
 * print("Début de l'attente");
 * await wait(5); // Attend 5 secondes avant de continuer l'exécution
 * print("Fin de l'attente");
 * ```
 */
    Future<void> wait(int delay) async {
  await Future.delayed(Duration(seconds: delay));
}