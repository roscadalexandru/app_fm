import '../model/model.dart';
import 'widgets.dart';
import 'package:flutter/material.dart' hide Image;

class TrackCover extends StatelessWidget {
  const TrackCover({
    Key? key,
    required this.track,
    this.onTap,
  }) : super(key: key);

  final Track track;
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
                url: track.getImage(ImageSize.large)),
            const BottomGradientBackground(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text.rich(
                TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: (track.name) + '\n',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: (track.artist.name!) + '\n',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'Listeners: ' + (track.listeners ?? '0'),
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
