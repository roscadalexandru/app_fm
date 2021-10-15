import 'package:json_annotation/json_annotation.dart';

import 'model.dart';

part 'track_info.g.dart';

@JsonSerializable(explicitToJson: true)
class TrackInfo {
  TrackInfo({
    this.name,
    this.artist,
    this.listeners,
    this.mbid,
    this.url,
    this.streamable,
    required this.image,
    this.attr,
    this.duration,
  });
  final String? name;
  final Artist? artist;
  final String? listeners;
  final String? mbid;
  final String? url;
  final dynamic streamable;
  final int? duration;
  @JsonKey(name: '@attr')
  final dynamic attr;
  final List<Image> image;

  String getImage([ImageSize imageSize = ImageSize.small]) {
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

  factory TrackInfo.fromJson(Map<String, dynamic> json) =>
      _$TrackInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TrackInfoToJson(this);
}
