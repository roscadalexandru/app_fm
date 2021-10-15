import '../model/model.dart';
import 'widgets.dart';
import 'package:flutter/material.dart' hide Image;

class ArtistCover extends StatelessWidget {
  const ArtistCover({Key? key, required this.artist, this.onTap})
      : super(key: key);

  final Artist artist;
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
                url: artist.getImage(ImageSize.large)),
            const BottomGradientBackground(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text.rich(
                TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: (artist.name ?? ''),
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    if (artist.listeners != null)
                      TextSpan(
                        text: '\nListeners: ' + (artist.listeners!),
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
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
