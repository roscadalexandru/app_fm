import 'package:app_fm/model/model.dart';
import 'package:app_fm/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ArtistsHorizontalList extends StatelessWidget {
  const ArtistsHorizontalList(this.artists, {Key? key}) : super(key: key);
  final List<Artist> artists;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Artist.getImageSize(ImageSize.large),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final artist = artists[index];
            return ArtistCover(
                artist: artist,
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/artist-details', arguments: artist);
                });
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8.0),
          itemCount: artists.length),
    );
  }
}
