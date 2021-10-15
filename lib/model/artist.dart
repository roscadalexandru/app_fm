import 'package:json_annotation/json_annotation.dart';

import 'model.dart';

part 'artist.g.dart';

@JsonSerializable(explicitToJson: true)
class Artist {
  Artist({
    this.name,
    this.listeners,
    this.mbid,
    this.url,
    this.streamable,
    required this.similar,
    required this.image,
    this.stats,
    this.summary,
    required this.tags,
  });

  final String? name;
  final String? listeners;
  final String? mbid;
  final String? url;
  final String? streamable;
  @JsonKey(fromJson: Image.fromJsonToImages)
  final List<Image> image;
  @JsonKey(fromJson: _fromJsonToSimilar)
  final List<Artist> similar;
  @JsonKey(name: "bio", fromJson: _fromJsonToSummary)
  final String? summary;
  final Stats? stats;
  @JsonKey(fromJson: Tag.fromJsonToTags)
  final List<Tag> tags;

  String? getImage([ImageSize imageSize = ImageSize.small]) {
    if (image.isEmpty) return null;
    return image
        .firstWhere((image) => image.size == imageSize.toString().split('.')[1],
            orElse: () => image.last)
        .url;
  }

  static double getImageSize([ImageSize imageSize = ImageSize.small]) {
    switch (imageSize) {
      case ImageSize.small:
        return 34;
      case ImageSize.medium:
        return 64;
      case ImageSize.large:
        return 174;
      case ImageSize.extraLarge:
        return 300;
    }
  }

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistToJson(this);

  @override
  String toString() {
    return 'Artist(name: $name, listeners: $listeners, mbid: $mbid, url: $url, streamable: $streamable, image: $image)';
  }

  static _fromJsonToSimilar(json) {
    if (json == null) return <Artist>[];

    return List<Artist>.from(json?["artist"]?.map((data) {
          return Artist.fromJson(data);
        }) ??
        []);
  }

  static _fromJsonToSummary(json) {
    return json?["summary"];
  }
}

@JsonSerializable()
class Stats {
  Stats({required this.listeners, required this.playcount});

  final String listeners;
  final String playcount;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}
