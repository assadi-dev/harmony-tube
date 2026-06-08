import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/cubit/auth/auth_cubit.dart';
import 'package:harmony_tube/cubit/auth/auth_state.dart';

class GoogleSignButton extends StatelessWidget {
  const GoogleSignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isLoading = state.status == AuthStatus.loading;
          final isAuthed = state.status == AuthStatus.authenticated;

          return Row(
            children: [
              ElevatedButton.icon(
                onPressed: isLoading
                    ? null
                    : () => context.read<AuthCubit>().signInWithGoogle(),
                icon: isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.login),
                label: Text(
                  isAuthed && state.account != null
                      ? state.account!.email
                      : 'Se connecter avec Google',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
