import 'package:app_fm/model/model.dart';
import 'package:app_fm/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        size: Size.fromWidth(Artist.getImageSize(ImageSize.large)),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: CachedImageHandled(url: artist.getImage(ImageSize.large)),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: const LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  stops: [0.25, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
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
