import 'package:app_fm/model/model.dart';
import 'package:app_fm/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'album_details.dart';
import 'widgets/widgets.dart';

class AlbumDetailsView extends StatelessWidget {
  const AlbumDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumDetailsCubit, AlbumDetailsState>(
      builder: (context, state) {
        switch (state.status) {
          case AlbumDetailsStatus.idle:
            return const Center(child: Text('Search for any album'));
          case AlbumDetailsStatus.loading:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case AlbumDetailsStatus.success:
            if (state.album == null) {
              return const Text('Couldn`t load album`s details');
            }
            return AlbumDetails(state.album!);
          case AlbumDetailsStatus.failure:
            return const Center(child: Text('Couldn`t load album`s details'));
        }
      },
    );
  }
}

class AlbumDetails extends StatelessWidget {
  const AlbumDetails(this.album, {Key? key}) : super(key: key);
  final Album album;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AlbumSmallDetails(
            name: album.name!,
            artist: album.artist!,
            albumImage: album.getImage(ImageSize.medium),
            playcount: album.playcount!,
          ),
          TagsList(tags: album.tags),
          Summary(
            summary: album.wiki?["summary"],
            emptyContentDisplay: 'There is no album description',
          ),
          TracksList(tracks: album.tracks)
        ],
      ),
    );
  }
}
