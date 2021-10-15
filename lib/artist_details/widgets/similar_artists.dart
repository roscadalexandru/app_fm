import 'package:flutter/widgets.dart';

import '../../home/widgets/widgets.dart';
import '../../model/model.dart';

class SimilarArtists extends StatelessWidget {
  const SimilarArtists({Key? key, required this.artists}) : super(key: key);

  final List<Artist> artists;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
          child: Text(
            'Similar artists',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ArtistsHorizontalList(artists)
      ],
    );
  }
}
