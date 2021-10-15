import 'package:app_fm/artist_details/artist_details.dart';
import 'package:app_fm/error_handler/error_handler.dart';
import 'package:app_fm/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistDetailScreen extends StatelessWidget {
  const ArtistDetailScreen({Key? key, required this.artist}) : super(key: key);

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return ErrorListener(
      child: BlocProvider(
        create: (context) => ArtistDetailsCubit(artist)..getArtistDetails(),
        child: BlocListener<ArtistDetailsCubit, ArtistDetailsState>(
          listener: (context, state) {
            if (state.status == ArtistDetailsStatus.failure) {
              context
                  .read<ErrorHandlerCubit>()
                  .displayError(state.errorMessage!);
            }
          },
          child: Scaffold(
            appBar: AppBar(),
            body: const ArtistDetailsView(),
          ),
        ),
      ),
    );
  }
}
