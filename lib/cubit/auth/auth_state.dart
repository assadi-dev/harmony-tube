import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harmony_tube/core/errors/failure.dart';

enum AuthStatus { idle, loading, authenticated, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final GoogleSignInAccount? account;
  final Failure? error;

  const AuthState({
    this.status = AuthStatus.idle,
    this.account,
    this.error,
  });

  AuthState copyWith({
    AuthStatus? status,
    GoogleSignInAccount? account,
    Object? error = _sentinel,
  }) {
    return AuthState(
      status: status ?? this.status,
      account: account ?? this.account,
      error: identical(error, _sentinel) ? this.error : error as Failure?,
    );
  }

  @override
  List<Object?> get props => [status, account, error];
}

const Object _sentinel = Object();
