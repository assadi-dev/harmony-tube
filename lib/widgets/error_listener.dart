import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_state.dart';
import 'package:harmony_tube/bloc/playlist_tracks/playlist_tracks_bloc.dart';
import 'package:harmony_tube/bloc/playlist_tracks/playlist_tracks_state.dart';
import 'package:harmony_tube/bloc/track/track_bloc.dart';
import 'package:harmony_tube/bloc/track/track_state.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/cubit/auth/auth_cubit.dart';
import 'package:harmony_tube/cubit/auth/auth_state.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_bloc.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_state.dart';

class ErrorListener extends StatelessWidget {
  final Widget child;

  const ErrorListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PlaylistBloc, PlaylistState>(
          listenWhen: (prev, curr) => prev.error != curr.error,
          listener: (context, state) => _showFailure(context, state.error),
        ),
        BlocListener<PlaylistTracksBloc, PlaylistTracksState>(
          listenWhen: (prev, curr) => prev.error != curr.error,
          listener: (context, state) => _showFailure(context, state.error),
        ),
        BlocListener<TrackBloc, TrackState>(
          listenWhen: (prev, curr) => prev.error != curr.error,
          listener: (context, state) => _showFailure(context, state.error),
        ),
        BlocListener<CategoriesBloc, CategoriesState>(
          listenWhen: (prev, curr) => prev.error != curr.error,
          listener: (context, state) => _showFailure(context, state.error),
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (prev, curr) => prev.error != curr.error,
          listener: (context, state) => _showFailure(context, state.error),
        ),
      ],
      child: child,
    );
  }

  void _showFailure(BuildContext context, Failure? failure) {
    if (failure == null) return;
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;

    messenger.showSnackBar(
      SnackBar(
        content: Text('${_prefixFor(failure)} : ${failure.message}'),
        backgroundColor: _colorFor(failure),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  String _prefixFor(Failure failure) {
    return switch (failure) {
      NetworkFailure _ => 'Réseau',
      AuthFailure _ => 'Connexion',
      CacheFailure _ => 'Cache',
      ValidationFailure _ => 'Validation',
      NotFoundFailure _ => 'Introuvable',
      UnknownFailure _ => 'Erreur',
    };
  }

  Color _colorFor(Failure failure) {
    return switch (failure) {
      NetworkFailure _ => Colors.orange.shade700,
      AuthFailure _ => Colors.red.shade700,
      ValidationFailure _ => Colors.amber.shade800,
      NotFoundFailure _ => Colors.blueGrey.shade700,
      CacheFailure _ => Colors.purple.shade700,
      UnknownFailure _ => Colors.red.shade900,
    };
  }
}
