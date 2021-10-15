import '../../model/model.dart';
import '../../widgets/widgets.dart';
import 'package:flutter/material.dart' hide Image;

class TrackHorizontalList extends StatelessWidget {
  const TrackHorizontalList(this.tracks, {Key? key}) : super(key: key);
  final List<Track> tracks;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Image.getImageSize(ImageSize.large),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final track = tracks[index];
            return TrackCover(
              track: track,
              onTap: () => Navigator.of(context)
                  .pushNamed('/track-details', arguments: track),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8.0),
          itemCount: tracks.length),
    );
  }
}
