import '../model/model.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'artist_details.dart';
import 'widgets/widgets.dart';

class ArtistDetailsView extends StatelessWidget {
  const ArtistDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistDetailsCubit, ArtistDetailsState>(
      builder: (context, state) {
        switch (state.status) {
          case ArtistDetailsStatus.idle:
            return const Center(child: Text('Search for any artist'));
          case ArtistDetailsStatus.loading:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case ArtistDetailsStatus.success:
            return ArtistDetails(state.artist!);
          case ArtistDetailsStatus.failure:
            return const Center(child: Text('Couldn`t load artist`s details'));
        }
      },
    );
  }
}

class ArtistDetails extends StatelessWidget {
  const ArtistDetails(this.artist, {Key? key}) : super(key: key);
  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArtistSmallDetails(
              artistImage: artist.getImage(ImageSize.medium),
              name: artist.name ?? '',
              listeners: artist.stats?.listeners ?? '0'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TagsList(tags: artist.tags),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Summary(
                summary: artist.summary,
                emptyContentDisplay: 'There is no artist description'),
          ),
          SimilarArtists(artists: artist.similar)
        ],
      ),
    );
  }
}
