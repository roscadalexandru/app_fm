import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api/last_fm_api.dart';
import '../../model/model.dart';

part 'artist_details_state.dart';

class ArtistDetailsCubit extends Cubit<ArtistDetailsState> {
  ArtistDetailsCubit(Artist artist)
      : _artist = artist,
        super(ArtistDetailsState.init());

  final Artist _artist;

  Future<void> getArtistDetails() async {
    if (state.status == ArtistDetailsStatus.loading) return;
    try {
      emit(state.copyWith(status: ArtistDetailsStatus.loading));
      final artist =
          await LastFmApi.getArtistInfo(_artist.mbid, name: _artist.name);
      if (artist == null) {
        throw ('Something went wrong');
      }
      emit(state.copyWith(artist: artist, status: ArtistDetailsStatus.success));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: '$e', status: ArtistDetailsStatus.failure));
    }
  }
}
