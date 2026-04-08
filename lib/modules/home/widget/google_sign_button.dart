import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignButton extends StatefulWidget {
  const GoogleSignButton({super.key});

  @override
  State<GoogleSignButton> createState() => _GoogleSignButtonState();
}

class _GoogleSignButtonState extends State<GoogleSignButton> {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false; // has granted permissions?
  String _contactText = '';
  String _errorMessage = '';
  String _serverAuthCode = '';

  Future<void> _handleSignIn() async {
    try {
      print(_isAuthorized);
      print(_currentUser?.id);
      await _googleSignIn.initialize(
        clientId:
            "1016049156687-gcb66au67oir8lgtlqst42ms17o19agv.apps.googleusercontent.com",
        serverClientId:
            "1016049156687-gcb66au67oir8lgtlqst42ms17o19agv.apps.googleusercontent.com",
      );
      final res = await _googleSignIn.authenticate();
      print(res.id);
    } catch (error) {
      print(error);
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
