import 'package:app_fm/model/model.dart';
import 'package:app_fm/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AlbumsHorizontalList extends StatelessWidget {
  const AlbumsHorizontalList(this.albums, {Key? key}) : super(key: key);
  final List<Album> albums;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Album.getImageSize(ImageSize.large),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final album = albums[index];
            return AlbumCover(album: album);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8.0),
          itemCount: albums.length),
    );
  }
}
