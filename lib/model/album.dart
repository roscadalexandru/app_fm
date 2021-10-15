import 'package:json_annotation/json_annotation.dart';

import 'model.dart';

part 'album.g.dart';

@JsonSerializable(explicitToJson: true)
class Album {
  Album({
    this.name,
    this.artist,
    this.url,
    this.mbid,
    required this.image,
    this.playcount,
    required this.tags,
    required this.tracks,
    this.wiki,
  });

  final String? name;
  final String? artist;
  final String? url;
  final String? mbid;
  @JsonKey(includeIfNull: true, defaultValue: <Image>[])
  final List<Image> image;
  final String? playcount;
  @JsonKey(fromJson: Track.fromJsonToTracks)
  final List<Track> tracks;
  final dynamic wiki;
  @JsonKey(fromJson: Tag.fromJsonToTags)
  final List<Tag> tags;

  String getImage([ImageSize imageSize = ImageSize.small]) {
    final url = image
        .firstWhere((image) => image.size == imageSize.toString().split('.')[1],
            orElse: () => image.last)
        .url;
    if (url.isEmpty) print(artist);
    return url;
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

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  @override
  String toString() {
    return 'Album(name: $name,\n artist: $artist,\n url: $url,\n image: $image)\n' +
        '-' * 100;
  }
}
