import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  Tag({required this.name, required this.url});

  final String name;
  final String url;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);

  static fromJsonToTags(json) {
    if (json == null) return <Tag>[];
    return List<Tag>.from(json?["tag"]?.map((data) {
          return Tag.fromJson(data);
        }) ??
        []);
  }
}
