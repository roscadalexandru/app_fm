import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/model.dart';
import 'api.dart';

class LastFmApi {
  static Future<List<Album>> searchAlbums(String name,
      {int page = 1, int limit = 10}) async {
    final httpResponse = await http.get(
      Uri(
        scheme: LastFmApiConfig.scheme,
        host: LastFmApiConfig.urlRoot,
        pathSegments: ['2.0'],
        queryParameters: {
          "method": "album.search",
          "limit": '$limit',
          "page": '$page',
          "album": name,
          "api_key": LastFmApiConfig.apiKey,
          "format": "json"
        },
      ),
    );
    final parseResponse = jsonDecode(httpResponse.body);
    if (parseResponse["error"] != null) {
      throw LastFmApiException(parseResponse["error"]);
    }
    final results = parseResponse["results"];
    final albumMatches = results["albummatches"];
    final albums = List<Album>.from(
        albumMatches["album"].map((data) => Album.fromJson(data)));
    return albums;
  }

  static Future<Album> getAlbumInfo(mbid,
      {String? artist = '',
      String? name = '',
      int page = 1,
      int limit = 10}) async {
    final httpResponse = await http.get(
      Uri(
        scheme: LastFmApiConfig.scheme,
        host: LastFmApiConfig.urlRoot,
        pathSegments: ['2.0'],
        queryParameters: {
          "method": "album.getinfo",
          "artist": artist ?? '',
          "album": name ?? '',
          "mbid": mbid ?? '',
          "api_key": LastFmApiConfig.apiKey,
          "format": "json"
        },
      ),
    );
    final parseResponse = jsonDecode(httpResponse.body);
    if (parseResponse["error"] != null) {
      throw LastFmApiException(parseResponse["error"]);
    }
    final album = Album.fromJson(parseResponse["album"]);
    return album;
  }

  static Future<List<Artist>> searchArtist(String name,
      {int page = 1, int limit = 10}) async {
    final httpResponse = await http.get(
      Uri(
        scheme: LastFmApiConfig.scheme,
        host: LastFmApiConfig.urlRoot,
        pathSegments: ['2.0'],
        queryParameters: {
          "method": "artist.search",
          "limit": '$limit',
          "page": '$page',
          "artist": name,
          "api_key": LastFmApiConfig.apiKey,
          "format": "json"
        },
      ),
    );
    final parseResponse = jsonDecode(httpResponse.body);
    if (parseResponse["error"] != null) {
      throw LastFmApiException(parseResponse["error"]);
    }
    final results = parseResponse["results"];
    final albumMatches = results["artistmatches"];
    final artists = List<Artist>.from(
        albumMatches["artist"].map((data) => Artist.fromJson(data)));
    return artists;
  }

  static Future<Artist> getArtistInfo(mbid,
      {String? name = '', int page = 1, int limit = 10}) async {
    final httpResponse = await http.get(
      Uri(
        scheme: LastFmApiConfig.scheme,
        host: LastFmApiConfig.urlRoot,
        pathSegments: ['2.0'],
        queryParameters: {
          "method": "artist.getinfo",
          "artist": name ?? '',
          "mbid": mbid ?? '',
          "api_key": LastFmApiConfig.apiKey,
          "format": "json"
        },
      ),
    );
    final parseResponse = jsonDecode(httpResponse.body);
    if (parseResponse["error"] != null) {
      throw LastFmApiException(parseResponse["error"]);
    }
    final artist = Artist.fromJson(parseResponse["artist"]);
    return artist;
  }

  static Future<List<Track>> searchTracks(String name,
      {int page = 1, int limit = 10, String artist = ''}) async {
    final httpResponse = await http.get(
      Uri(
        scheme: LastFmApiConfig.scheme,
        host: LastFmApiConfig.urlRoot,
        pathSegments: ['2.0'],
        queryParameters: {
          "method": "track.search",
          "limit": '$limit',
          "page": '$page',
          "track": name,
          "artist": artist,
          "api_key": LastFmApiConfig.apiKey,
          "format": "json"
        },
      ),
    );
    final parseResponse = jsonDecode(httpResponse.body);
    if (parseResponse["error"] != null) {
      throw LastFmApiException(parseResponse["error"]);
    }
    final results = parseResponse["results"];
    final albumMatches = results["trackmatches"];
    final artists = List<Track>.from(
        albumMatches["track"].map((data) => Track.fromJson(data)));
    return artists;
  }

  static Future<Track> getTrackInfo(mbid,
      {String? name = '',
      String? artist = '',
      int page = 1,
      int limit = 10}) async {
    final httpResponse = await http.get(
      Uri(
        scheme: LastFmApiConfig.scheme,
        host: LastFmApiConfig.urlRoot,
        pathSegments: ['2.0'],
        queryParameters: {
          "method": "track.getinfo",
          "track": name ?? '',
          "artist": artist ?? '',
          "mbid": mbid ?? '',
          "api_key": LastFmApiConfig.apiKey,
          "format": "json"
        },
      ),
    );
    final parseResponse = jsonDecode(httpResponse.body);
    if (parseResponse["error"] != null) {
      throw LastFmApiException(parseResponse["error"]);
    }
    final track = Track.fromJson(parseResponse["track"]);
    return track;
  }
}
