part of 'artist_details_cubit.dart';

enum ArtistDetailsStatus { idle, loading, success, failure }

class ArtistDetailsState extends Equatable {
  const ArtistDetailsState({
    required this.status,
    this.errorMessage,
    this.artist,
  });

  factory ArtistDetailsState.init() =>
      const ArtistDetailsState(status: ArtistDetailsStatus.idle);

  final ArtistDetailsStatus status;
  final String? errorMessage;
  final Artist? artist;

  ArtistDetailsState copyWith({
    ArtistDetailsStatus? status,
    String? errorMessage,
    Artist? artist,
  }) =>
      ArtistDetailsState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        artist: artist ?? this.artist,
      );

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        artist,
      ];
}
