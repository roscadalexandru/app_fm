import '../../widgets/widgets.dart';
import 'package:flutter/material.dart';

class ArtistSmallDetails extends StatelessWidget {
  const ArtistSmallDetails(
      {Key? key,
      required this.artistImage,
      required this.name,
      required this.listeners})
      : super(key: key);

  final String? artistImage;
  final String name;
  final String listeners;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      child: Row(
        children: [
          CachedImageHandled(
            borderRadius: BorderRadius.circular(5.0),
            url: artistImage,
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
                  const SizedBox(height: 8.0),
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
