import 'package:app_fm/album_details/album_details.dart';
import 'package:app_fm/home/home.dart';
import 'package:flutter/material.dart';

import 'artist_details/artist_details.dart';
import 'model/model.dart';
import 'track_details/track_details.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      case '/album-details':
        final album = settings.arguments as Album;
        return MaterialPageRoute(
          builder: (context) => AlbumDetailScreen(album: album),
          settings: settings,
        );
      case '/artist-details':
        final artist = settings.arguments as Artist;
        return MaterialPageRoute(
          builder: (context) => ArtistDetailScreen(artist: artist),
          settings: settings,
        );
      case '/track-details':
        final track = settings.arguments as Track;
        return MaterialPageRoute(
          builder: (context) => TrackDetailScreen(track: track),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              NoRouteScreen(settings.name ?? 'undefined route name'),
          settings: settings,
        );
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen(this.routeName, {Key? key}) : super(key: key);

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Route $routeName doesn`t exist'),
      ),
    );
  }
}
