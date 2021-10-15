part of 'album_details_cubit.dart';

enum AlbumDetailsStatus { idle, loading, success, failure }

class AlbumDetailsState extends Equatable {
  const AlbumDetailsState({
    required this.status,
    this.errorMessage,
    this.album,
  });

  factory AlbumDetailsState.init() =>
      const AlbumDetailsState(status: AlbumDetailsStatus.idle);

  final AlbumDetailsStatus status;
  final String? errorMessage;
  final Album? album;

  AlbumDetailsState copyWith({
    AlbumDetailsStatus? status,
    String? errorMessage,
    Album? album,
  }) =>
      AlbumDetailsState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        album: album ?? this.album,
      );

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        album,
      ];
}
