import '../../widgets/widgets.dart';
import 'package:flutter/material.dart';

class TrackSmallDetails extends StatelessWidget {
  const TrackSmallDetails(
      {Key? key,
      this.artistImage,
      this.albumImage,
      required this.name,
      required this.artistName,
      required this.time,
      required this.listeners})
      : super(key: key);

  final String? albumImage;
  final String? artistImage;
  final String name;
  final String artistName;
  final String listeners;
  final String time;

  @override
  Widget build(BuildContext context) {
    final ablumOrArstiImageExists = artistImage != null || albumImage != null;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ablumOrArstiImageExists ? 16.0 : 0.0, 0.0, 16.0, 0.0),
      child: Row(
        children: [
          CachedImageHandled(
              borderRadius: BorderRadius.circular(5.0), url: artistImage),
          if (artistImage != null) const SizedBox(width: 8.0),
          CachedImageHandled(
              borderRadius: BorderRadius.circular(5.0), url: albumImage),
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
                    artistName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(time),
                  Text.rich(
                    TextSpan(
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                        children: [
                          const TextSpan(text: "Listeners: "),
                          TextSpan(
                              text: listeners,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                        ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
