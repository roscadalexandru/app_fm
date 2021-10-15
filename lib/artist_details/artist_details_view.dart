import 'package:app_fm/home/widgets/widgets.dart';
import 'package:app_fm/model/model.dart';
import 'package:app_fm/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
            if (state.artist == null) {
              return const Text('Couldn`t load artist`s details');
            }
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

class SimilarArtists extends StatelessWidget {
  const SimilarArtists({Key? key, required this.artists}) : super(key: key);

  final List<Artist> artists;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
          child: Text(
            'Similar artists',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ArtistsHorizontalList(artists)
      ],
    );
  }
}

class ArtistSmallDetails extends StatelessWidget {
  const ArtistSmallDetails(
      {Key? key,
      required this.artistImage,
      required this.name,
      required this.listeners})
      : super(key: key);

  final String? artistImage;
  final String name;
  final String listeners;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: CachedImageHandled(url: artistImage),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text.rich(
                    TextSpan(
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                        children: [
                          const TextSpan(text: "Listeners: "),
                          TextSpan(
                              text: listeners,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                        ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
