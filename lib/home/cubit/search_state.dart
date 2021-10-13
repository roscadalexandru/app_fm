part of 'search_cubit.dart';

enum SearchAlbumStatus { idle, loading, success, failure }

class SearchState extends Equatable {
  const SearchState({
    required this.status,
    this.errorMessage,
    required this.albums,
    required this.artists,
    required this.tracks,
  });

  factory SearchState.init() => const SearchState(
        status: SearchAlbumStatus.idle,
        albums: [],
        artists: [],
        tracks: [],
      );

  final SearchAlbumStatus status;
  final String? errorMessage;
  final List<Album> albums;
  final List<Artist> artists;
  final List<Track> tracks;

  SearchState copyWith({
    SearchAlbumStatus? status,
    String? errorMessage,
    List<Album>? albums,
    List<Artist>? artists,
    List<Track>? tracks,
  }) =>
      SearchState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        albums: albums ?? this.albums,
        artists: artists ?? this.artists,
        tracks: tracks ?? this.tracks,
      );

  @override
  List<Object?> get props => [status, errorMessage, albums, artists, tracks];
}
