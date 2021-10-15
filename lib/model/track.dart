import 'package:json_annotation/json_annotation.dart';

import 'model.dart';

part 'track.g.dart';

@JsonSerializable(explicitToJson: true)
class Track {
  Track(
      {required this.name,
      required this.artist,
      this.album,
      this.listeners,
      this.mbid,
      required this.url,
      required this.image,
      this.rank,
      this.duration,
      required this.tags,
      this.summary});
  final String name;
  final String? listeners;
  final String? mbid;
  final String? url;
  @JsonKey(fromJson: Image.fromJsonToImages)
  final List<Image> image;
  @JsonKey(fromJson: _fromJsonToDuration)
  final int? duration;
  @JsonKey(name: '@attr', fromJson: _fromJsonToRank)
  final int? rank;
  @JsonKey(fromJson: _fromJsonToArtist)
  final Artist artist;
  @JsonKey(fromJson: _fromJsonToAlbum)
  final Album? album;
  @JsonKey(name: 'toptags', fromJson: Tag.fromJsonToTags)
  final List<Tag> tags;
  @JsonKey(name: 'wiki', fromJson: _fromJsonToSummary)
  final String? summary;

  String? getImage([ImageSize imageSize = ImageSize.small]) {
    if (image.isEmpty) return null;
    return image
        .firstWhere((image) => image.size == imageSize.toString().split('.')[1],
            orElse: () => image.last)
        .url;
  }

  String get convertDurationToTime {
    if (duration == null || duration == 0) {
      return '-- : --';
    }
    final m = duration! ~/ 60;
    final s = '${duration! % 60}'.padLeft(2, '0');
    return '$m : $s';
  }

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);

  @override
  String toString() {
    return 'Track(name: $name, listeners: $listeners, mbid: $mbid, url: $url,  image: $image)';
  }

  static fromJsonToTracks(json) {
    if (json == null) return <Track>[];
    if (json["track"] is! List) return [Track.fromJson(json["track"])];
    return List<Track>.from(json["track"]?.map((data) {
          return Track.fromJson(data);
        }) ??
        []);
  }

  static _fromJsonToRank(json) {
    return json?["rank"] ?? 0;
  }

  static _fromJsonToArtist(json) {
    if (json is String) {
      return Artist(
          name: json, similar: <Artist>[], image: <Image>[], tags: <Tag>[]);
    }
    return Artist.fromJson(json);
  }

  static _fromJsonToDuration(json) {
    if (json is String) {
      return (int.tryParse(json) ?? 0) ~/ 1000;
    }
    return json;
  }

  static _fromJsonToSummary(json) {
    return json?["summary"];
  }

  static _fromJsonToAlbum(json) {
    if (json != null) {
      return Album(
        artist: json["artist"],
        name: json["title"],
        image: Image.fromJsonToImages(json["image"]),
        tags: <Tag>[],
        tracks: <Track>[],
      );
    }
    return null;
  }
}
