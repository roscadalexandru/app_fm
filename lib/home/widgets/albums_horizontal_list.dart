import '../../model/model.dart';
import '../../widgets/widgets.dart';
import 'package:flutter/material.dart' hide Image;

class AlbumsHorizontalList extends StatelessWidget {
  const AlbumsHorizontalList(this.albums, {Key? key}) : super(key: key);
  final List<Album> albums;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Image.getImageSize(ImageSize.large),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final album = albums[index];
            return AlbumCover(
              album: album,
              onTap: () => Navigator.of(context)
                  .pushNamed('/album-details', arguments: album),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8.0),
          itemCount: albums.length),
    );
  }
}
