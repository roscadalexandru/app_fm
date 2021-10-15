import '../../model/model.dart';
import 'package:flutter/material.dart';

import 'track_list_tile.dart';

class TracksList extends StatelessWidget {
  const TracksList({Key? key, required this.tracks}) : super(key: key);

  final List<Track> tracks;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
          child: Text(
            'Tracks',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (tracks.isEmpty)
          const Text('This album doesn`t containt any tracks')
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tracks.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8.0);
            },
            itemBuilder: (BuildContext context, int index) {
              final track = tracks[index];
              return TrackListTile(track: track);
            },
          ),
      ],
    );
  }
}
