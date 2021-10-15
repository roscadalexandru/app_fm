
import '../../model/model.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({
    Key? key,
    required this.albums,
    required this.artists,
    required this.tracks,
  }) : super(key: key);

  final List<Album> albums;
  final List<Artist> artists;
  final List<Track> tracks;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 16.0),
            child: Text(
              'Artists',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ArtistsHorizontalList(artists),
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 24.0, 0.0, 16.0),
            child: Text(
              'Albums',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AlbumsHorizontalList(albums),
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 24.0, 0.0, 16.0),
            child: Text(
              'Tracks',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TrackHorizontalList(tracks),
        ],
      ),
    );
  }
}
