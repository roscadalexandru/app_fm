import 'track_details.dart';
import '../error_handler/error_handler.dart';
import '../model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackDetailScreen extends StatelessWidget {
  const TrackDetailScreen({Key? key, required this.track}) : super(key: key);

  final Track track;

  @override
  Widget build(BuildContext context) {
    return ErrorListener(
      child: BlocProvider(
        create: (context) => TrackDetailsCubit(track)..getTrackDetails(),
        child: BlocListener<TrackDetailsCubit, TrackDetailsState>(
          listener: (context, state) {
            if (state.status == TrackDetailsStatus.failure) {
              context
                  .read<ErrorHandlerCubit>()
                  .displayError(state.errorMessage!);
            }
          },
          child: Scaffold(
            appBar: AppBar(),
            body: const TrackDetailsView(),
          ),
        ),
      ),
    );
  }
}
