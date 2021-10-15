part of 'track_details_cubit.dart';

enum TrackDetailsStatus { idle, loading, success, failure }

class TrackDetailsState extends Equatable {
  const TrackDetailsState({
    required this.status,
    this.errorMessage,
    this.track,
  });

  factory TrackDetailsState.init() =>
      const TrackDetailsState(status: TrackDetailsStatus.idle);

  final TrackDetailsStatus status;
  final String? errorMessage;
  final Track? track;

  TrackDetailsState copyWith({
    TrackDetailsStatus? status,
    String? errorMessage,
    Track? track,
  }) =>
      TrackDetailsState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        track: track ?? this.track,
      );

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        track,
      ];
}
