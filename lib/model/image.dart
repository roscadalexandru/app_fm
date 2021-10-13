import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

enum ImageSize { small, medium, large, extraLarge }

@JsonSerializable(explicitToJson: true)
class Image {
  Image({required this.url, required this.size});
  @JsonKey(name: '#text')
  String url;
  String size;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);

  @override
  String toString() => 'Image(url: $url, size: $size)';
}
