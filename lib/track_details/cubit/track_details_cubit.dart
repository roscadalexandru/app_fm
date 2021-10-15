import 'package:app_fm/last_fm_api.dart';
import 'package:app_fm/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'track_details_state.dart';

class TrackDetailsCubit extends Cubit<TrackDetailsState> {
  TrackDetailsCubit(Track track)
      : _track = track,
        super(TrackDetailsState.init());

  final Track _track;

  Future<void> getTrackDetails() async {
    if (state.status == TrackDetailsStatus.loading) return;
    try {
      emit(state.copyWith(status: TrackDetailsStatus.loading));
      final track = await LastFmApi.getTrackInfo(
        _track.mbid,
        name: _track.name,
        artist: _track.artist.name,
      );
      emit(state.copyWith(track: track, status: TrackDetailsStatus.success));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: '$e', status: TrackDetailsStatus.failure));
    }
  }
}
