import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/model.dart';

class LastFmApi {
  static const scheme = 'http';
  static const String urlRoot = 'ws.audioscrobbler.com';
  static const String _apiKey = 'cbb7e38d666a6324290e59916239b840';
  static const String _secret = '76248f09ea04fbe0fa29c232d1a5942c';

  static Future<List<Album>> searchAlbums(String name,
      {int page = 1, int limit = 10}) async {
    final httpResponse = await http.get(
      Uri(
        scheme: scheme,
        host: urlRoot,
        pathSegments: ['2.0'],
        queryParameters: {
          "method": "album.search",
          "limit": '$limit',
          "page": '$page',
          "album": name,
          "api_key": _apiKey,
          "format": "json"
        },
      ),
    );
    final parseResponse = jsonDecode(httpResponse.body);
    final results = parseResponse["results"];
    final albumMatches = results["albummatches"];
    final albums = List<Album>.from(
        albumMatches["album"].map((data) => Album.fromJson(data)));
    return albums;
  }

  static Future<List<Artist>> searchArtist(String name,
      {int page = 1, int limit = 10}) async {
    final httpResponse = await http.get(
      Uri(
        scheme: scheme,
        host: urlRoot,
        pathSegments: ['2.0'],
        queryParameters: {
          "method": "artist.search",
          "limit": '$limit',
          "page": '$page',
          "artist": name,
          "api_key": _apiKey,
          "format": "json"
        },
      ),
    );
    final parseResponse = jsonDecode(httpResponse.body);
    final results = parseResponse["results"];
    final albumMatches = results["artistmatches"];
    final artists = List<Artist>.from(
        albumMatches["artist"].map((data) => Artist.fromJson(data)));
    return artists;
  }

  static Future<List<Track>> searchTracks(String name,
      {int page = 1, int limit = 10, String artist = ''}) async {
    final httpResponse = await http.get(
      Uri(
        scheme: scheme,
        host: urlRoot,
        pathSegments: ['2.0'],
        queryParameters: {
          "method": "track.search",
          "limit": '$limit',
          "page": '$page',
          "track": name,
          "artist": artist,
          "api_key": _apiKey,
          "format": "json"
        },
      ),
    );
    final parseResponse = jsonDecode(httpResponse.body);
    final results = parseResponse["results"];
    final albumMatches = results["trackmatches"];
    final artists = List<Track>.from(
        albumMatches["track"].map((data) => Track.fromJson(data)));
    return artists;
  }
}
