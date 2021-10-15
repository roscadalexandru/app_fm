import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

enum ImageSize { small, medium, large, extraLarge }

@JsonSerializable(explicitToJson: true)
class Image {
  Image({required this.url, required this.size});
  @JsonKey(name: '#text')
  final String url;
  final String size;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);

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

  @override
  String toString() => 'Image(url: $url, size: $size)';

  static fromJsonToImages(json) {
    if (json == null) return <Image>[];
    return List<Image>.from(json?.map((data) {
          return Image.fromJson(data);
        }) ??
        <Image>[]);
  }
}
