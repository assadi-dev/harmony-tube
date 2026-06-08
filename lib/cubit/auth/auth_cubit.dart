import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/core/services/google_auth_service.dart';
import 'package:harmony_tube/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GoogleAuthService googleAuthService;

  AuthCubit({required this.googleAuthService}) : super(const AuthState());

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    final result = await googleAuthService.signIn();
    emit(
      result.fold(
        onSuccess: (account) => state.copyWith(
          status: AuthStatus.authenticated,
          account: account,
          error: null,
        ),
        onFailure: (failure) => state.copyWith(
          status: AuthStatus.error,
          error: failure,
        ),
      ),
    );
  }
}
