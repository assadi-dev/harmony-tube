import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/track/track_event.dart';
import 'package:harmony_tube/bloc/track/track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackBloc() : super( TrackState());
}