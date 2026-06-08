import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/errors/result.dart';
import 'package:harmony_tube/core/services/google_auth_service.dart';
import 'package:harmony_tube/cubit/auth/auth_cubit.dart';
import 'package:harmony_tube/cubit/auth/auth_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockGoogleAuthService extends Mock implements GoogleAuthService {}

class _FakeGoogleSignInAccount extends Fake implements GoogleSignInAccount {
  @override
  String get email => 'user@example.com';
}

void main() {
  late _MockGoogleAuthService service;
  late AuthCubit cubit;

  setUp(() {
    service = _MockGoogleAuthService();
    cubit = AuthCubit(googleAuthService: service);
  });

  tearDown(() => cubit.close());

  test('initial state is idle', () {
    expect(cubit.state.status, AuthStatus.idle);
    expect(cubit.state.account, isNull);
    expect(cubit.state.error, isNull);
  });

  test('signInWithGoogle emits loading then authenticated on success',
      () async {
    final account = _FakeGoogleSignInAccount();
    when(service.signIn).thenAnswer((_) async => Result.success(account));

    final states = <AuthState>[];
    final sub = cubit.stream.listen(states.add);

    await cubit.signInWithGoogle();
    await Future.delayed(Duration.zero);

    expect(states.first.status, AuthStatus.loading);
    expect(states.last.status, AuthStatus.authenticated);
    expect(states.last.account, account);
    expect(states.last.error, isNull);

    await sub.cancel();
  });

  test('signInWithGoogle emits error status with Failure on failure',
      () async {
    when(service.signIn).thenAnswer(
      (_) async => const Result.failure(
        AuthFailure(message: 'SHA-1 missing'),
      ),
    );

    await cubit.signInWithGoogle();

    expect(cubit.state.status, AuthStatus.error);
    expect(cubit.state.error, isA<AuthFailure>());
    expect(cubit.state.account, isNull);
  });
}
