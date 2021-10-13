import 'package:json_annotation/json_annotation.dart';

import 'model.dart';

part 'album.g.dart';

@JsonSerializable(explicitToJson: true)
class Album {
  Album({
    required this.name,
    required this.artist,
    required this.url,
    required this.image,
  });
  String? name;
  String? artist;
  String? url;
  List<Image> image;

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

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  @override
  String toString() {
    return 'Album(name: $name, artist: $artist, url: $url, image: $image)';
  }
}
