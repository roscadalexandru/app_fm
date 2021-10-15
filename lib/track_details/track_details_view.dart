import '../home/widgets/widgets.dart';
import '../model/model.dart';
import '../widgets/widgets.dart';
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
