import 'package:app_fm/album_details/album_details.dart';
import 'package:app_fm/error_handler/error_handler.dart';
import 'package:app_fm/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumDetailScreen extends StatelessWidget {
  const AlbumDetailScreen({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return ErrorListener(
      child: BlocProvider(
        create: (context) => AlbumDetailsCubit(album)..getAlbumDetails(),
        child: BlocListener<AlbumDetailsCubit, AlbumDetailsState>(
          listener: (context, state) {
            if (state.status == AlbumDetailsStatus.failure) {
              context
                  .read<ErrorHandlerCubit>()
                  .displayError(state.errorMessage!);
            }
          },
          child: Scaffold(
            appBar: AppBar(),
            body: const AlbumDetailsView(),
          ),
        ),
      ),
    );
  }
}
