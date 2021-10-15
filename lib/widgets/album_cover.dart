import '../model/model.dart';
import 'widgets.dart';
import 'package:flutter/material.dart' hide Image;

class AlbumCover extends StatelessWidget {
  const AlbumCover({Key? key, required this.album, this.onTap})
      : super(key: key);

  final Album album;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox.fromSize(
        size: Size.fromWidth(Image.getImageSize(ImageSize.large)),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CachedImageHandled(
              borderRadius: BorderRadius.circular(5.0),
              url: album.getImage(ImageSize.large),
            ),
            const BottomGradientBackground(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text.rich(
                TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: (album.artist ?? '') + '\n',
                      style: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: album.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}