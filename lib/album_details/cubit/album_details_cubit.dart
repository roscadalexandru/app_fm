import 'package:app_fm/last_fm_api.dart';
import 'package:app_fm/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'album_details_state.dart';

class AlbumDetailsCubit extends Cubit<AlbumDetailsState> {
  AlbumDetailsCubit(Album album)
      : _album = album,
        super(AlbumDetailsState.init());

  final Album _album;

  Future<void> getAlbumDetails() async {
    if (state.status == AlbumDetailsStatus.loading) return;
    try {
      emit(state.copyWith(status: AlbumDetailsStatus.loading));
      final album = await LastFmApi.getAlbumInfo(_album.mbid,
          artist: _album.artist, name: _album.name);
      emit(state.copyWith(album: album, status: AlbumDetailsStatus.success));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: '$e', status: AlbumDetailsStatus.failure));
    }
  }
}
