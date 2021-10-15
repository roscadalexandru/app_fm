import 'package:app_fm/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlbumSmallDetails extends StatelessWidget {
  const AlbumSmallDetails({
    Key? key,
    required this.name,
    required this.artist,
    required this.playcount,
    required this.albumImage,
  }) : super(key: key);

  final String name;
  final String artist;
  final String playcount;
  final String albumImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: CachedImageHandled(url: albumImage),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  artist,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text.rich(
                  TextSpan(
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                      children: [
                        const TextSpan(text: "Listened "),
                        TextSpan(
                            text: playcount,
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                        const TextSpan(text: " times")
                      ]),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
