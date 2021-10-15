import '../../model/model.dart';
import '../../widgets/widgets.dart';
import 'package:flutter/material.dart';

class AlbumsGrid extends StatelessWidget {
  const AlbumsGrid(
    this.albums, {
    Key? key,
  }) : super(key: key);

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return AlbumCover(album: album);
      },
    );
  }
}
