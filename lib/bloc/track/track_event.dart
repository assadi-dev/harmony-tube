import 'package:equatable/equatable.dart';
import 'package:harmony_tube/core/models/local_track.dart';

class TrackEvent extends Equatable {

  final TrackItemModel? track;

  const TrackEvent({ this.track});

  @override
  List<Object?> get props => [track!];
}


class GetAllTrackCollections extends TrackEvent {
  const GetAllTrackCollections();
}

class FindTrack extends TrackEvent {
  const FindTrack(TrackItemModel track);
}

class DeleteTrack extends TrackEvent {
  final String trackId;
  const DeleteTrack({required this.trackId});
}

class AddTrack extends TrackEvent {
  final TrackItemModel track;
  const AddTrack({required this.track});
}

class UpdateTrack extends TrackEvent {
  final TrackItemModel track;
  const UpdateTrack({required this.track});
}

class ClearTracksCollections extends TrackEvent {
  const ClearTracksCollections();
}