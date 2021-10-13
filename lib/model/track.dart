import 'package:json_annotation/json_annotation.dart';

import 'model.dart';

part 'track.g.dart';

@JsonSerializable(explicitToJson: true)
class Track {
  Track({
    required this.name,
    required this.artist,
    required this.listeners,
    required this.mbid,
    required this.url,
    required this.streamable,
    required this.image,
  });
  final String? name;
  final String? artist;
  final String? listeners;
  final String? mbid;
  final String? url;
  final String? streamable;
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

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);

  @override
  String toString() {
    return 'Track(name: $name, listeners: $listeners, mbid: $mbid, url: $url, streamable: $streamable, image: $image)';
  }
}
