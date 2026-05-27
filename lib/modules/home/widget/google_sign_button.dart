import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignButton extends StatefulWidget {
  const GoogleSignButton({super.key});

  @override
  State<GoogleSignButton> createState() => _GoogleSignButtonState();
}

class _GoogleSignButtonState extends State<GoogleSignButton> {
  // State variables for sign-in feedback can be added here if needed

  Future<void> _handleSignIn() async {
    try {
      // Use the singleton instance
      final GoogleSignIn signIn = GoogleSignIn.instance;

      // Initialize the sign-in with the Web Client ID as the serverClientId.
      // On Android, the clientId itself is usually resolved automatically 
      // from the package name and SHA-1 registered in the Google Cloud Console.
      const String webClientId = "1016049156687-gcb66au67oir8lgtlqst42ms17o19agv.apps.googleusercontent.com";
      
      await signIn.initialize(
        serverClientId: webClientId,
      );

      // authenticate() is the new method in google_sign_in 7.x 
      // to trigger the Google Sign-In flow via Credential Manager.
      final GoogleSignInAccount account = await signIn.authenticate();
      
      print("Signed in successfully: ${account.email}");
      final auth = await account.authentication;
      print("ID Token: ${auth.idToken}");
    } catch (error) {
      print("Google Sign-In Error: $error");
      // Error 16 [Account reauth failed] usually means the SHA-1 isn't registered.
      if (error.toString().contains("16") || error.toString().contains("Account reauth failed")) {
        print("TIP: Ensure your SHA-1 fingerprint (debug and release) is registered in the Google Cloud Console.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ElevatedButton.icon(
            onPressed: _handleSignIn,
            icon: Icon(Icons.login),
            label: Text("Se connecter avec Google"),
          ),
        ],
      ),
    );
  }
}
