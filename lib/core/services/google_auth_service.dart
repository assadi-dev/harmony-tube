import 'package:google_sign_in/google_sign_in.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/errors/result.dart';

class GoogleAuthService {
  final GoogleSignIn _signIn;
  final String _serverClientId;
  bool _initialized = false;

  GoogleAuthService({
    required String serverClientId,
    GoogleSignIn? signIn,
  })  : _signIn = signIn ?? GoogleSignIn.instance,
        _serverClientId = serverClientId;

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    await _signIn.initialize(serverClientId: _serverClientId);
    _initialized = true;
  }

  Future<Result<GoogleSignInAccount>> signIn() async {
    try {
      await _ensureInitialized();
      final account = await _signIn.authenticate();
      return Result.success(account);
    } on GoogleSignInException catch (e, st) {
      return Result.failure(
        AuthFailure(
          message: _mapGoogleSignInException(e),
          cause: e,
          stackTrace: st,
        ),
      );
    } catch (e, st) {
      return Result.failure(
        UnknownFailure(
          message: 'Erreur inattendue lors de la connexion',
          cause: e,
          stackTrace: st,
        ),
      );
    }
  }

  String _mapGoogleSignInException(GoogleSignInException e) {
    final raw = e.toString();
    if (raw.contains('16') || raw.contains('Account reauth failed')) {
      return 'Connexion refusée : empreinte SHA-1 non enregistrée dans la console Google';
    }
    return 'Échec de la connexion Google';
  }
}
