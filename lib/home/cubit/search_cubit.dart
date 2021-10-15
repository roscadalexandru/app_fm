import 'package:app_fm/last_fm_api.dart';
import 'package:app_fm/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.init());

  Future<void> searchAlbums(String name) async {
    if (state.status == SearchAlbumStatus.loading) return;
    try {
      emit(state.copyWith(status: SearchAlbumStatus.loading));
      final albums = await LastFmApi.searchAlbums(name);
      emit(state.copyWith(albums: albums, status: SearchAlbumStatus.success));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: '$e', status: SearchAlbumStatus.failure));
      emit(state.copyWith(status: SearchAlbumStatus.idle));
    }
  }

  Future<void> searchArtist(String name) async {
    if (state.status == SearchAlbumStatus.loading) return;
    try {
      emit(state.copyWith(status: SearchAlbumStatus.loading));
      final artists = await LastFmApi.searchArtist(name);
      emit(state.copyWith(artists: artists, status: SearchAlbumStatus.success));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: '$e', status: SearchAlbumStatus.failure));
      emit(state.copyWith(status: SearchAlbumStatus.idle));
    }
  }

  Future<void> searchTrack(String name) async {
    if (state.status == SearchAlbumStatus.loading) return;
    try {
      emit(state.copyWith(status: SearchAlbumStatus.loading));
      final tracks = await LastFmApi.searchTracks(name);
      emit(state.copyWith(tracks: tracks, status: SearchAlbumStatus.success));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: '$e', status: SearchAlbumStatus.failure));
      emit(state.copyWith(status: SearchAlbumStatus.idle));
    }
  }

  Future<void> search(String name) async {
    if (state.status == SearchAlbumStatus.loading) return;
    try {
      emit(state.copyWith(status: SearchAlbumStatus.loading));
      final albumsRequest = LastFmApi.searchAlbums(name);
      final artistRequest = LastFmApi.searchArtist(name);
      final tracksRequest = LastFmApi.searchTracks(name);
      final results =
          await Future.wait([albumsRequest, artistRequest, tracksRequest]);
      emit(state.copyWith(
          albums: results[0] as List<Album>,
          artists: results[1] as List<Artist>,
          tracks: results[2] as List<Track>,
          status: SearchAlbumStatus.success));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: '$e', status: SearchAlbumStatus.failure));
    }
  }
}
