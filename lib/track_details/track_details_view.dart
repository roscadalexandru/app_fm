import 'package:app_fm/home/widgets/widgets.dart';
import 'package:app_fm/model/model.dart';
import 'package:app_fm/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'track_details.dart';
import 'widgets/widgets.dart';

class TrackDetailsView extends StatelessWidget {
  const TrackDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackDetailsCubit, TrackDetailsState>(
      builder: (context, state) {
        switch (state.status) {
          case TrackDetailsStatus.idle:
            return const Center(child: Text('Search for any track'));
          case TrackDetailsStatus.loading:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case TrackDetailsStatus.success:
            if (state.track == null) {
              return const Text('Couldn`t load track`s details');
            }
            return TrackDetails(state.track!);
          case TrackDetailsStatus.failure:
            return const Center(child: Text('Couldn`t load track`s details'));
        }
      },
    );
  }
}

class TrackDetails extends StatelessWidget {
  const TrackDetails(this.track, {Key? key}) : super(key: key);
  final Track track;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TrackSmallDetails(
              artistImage: track.artist.getImage(ImageSize.medium),
              albumImage: track.album?.getImage(ImageSize.medium),
              name: track.name,
              artistName: track.artist.name!,
              time: track.convertDurationToTime,
              listeners: track.listeners ?? '0'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TagsList(tags: track.tags),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Summary(
                summary: track.summary,
                emptyContentDisplay: 'There is no track description'),
          ),
        ],
      ),
    );
  }
}

class TrackSmallDetails extends StatelessWidget {
  const TrackSmallDetails(
      {Key? key,
      this.artistImage,
      this.albumImage,
      required this.name,
      required this.artistName,
      required this.time,
      required this.listeners})
      : super(key: key);

  final String? albumImage;
  final String? artistImage;
  final String name;
  final String artistName;
  final String listeners;
  final String time;

  @override
  Widget build(BuildContext context) {
    final ablumOrArstiImageExists = artistImage != null || albumImage != null;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ablumOrArstiImageExists ? 16.0 : 0.0, 0.0, 16.0, 0.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: CachedImageHandled(url: artistImage),
          ),
          if (artistImage != null) const SizedBox(width: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: CachedImageHandled(url: albumImage),
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
                  Text(
                    artistName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(time),
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
