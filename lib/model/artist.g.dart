// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      name: json['name'] as String?,
      listeners: json['listeners'] as String?,
      mbid: json['mbid'] as String?,
      url: json['url'] as String?,
      streamable: json['streamable'] as String?,
      similar: Artist._fromJsonToSimilar(json['similar']),
      image: Image.fromJsonToImages(json['image']),
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
      summary: Artist._fromJsonToSummary(json['bio']),
      tags: Tag.fromJsonToTags(json['tags']),
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'name': instance.name,
      'listeners': instance.listeners,
      'mbid': instance.mbid,
      'url': instance.url,
      'streamable': instance.streamable,
      'image': instance.image.map((e) => e.toJson()).toList(),
      'similar': instance.similar.map((e) => e.toJson()).toList(),
      'bio': instance.summary,
      'stats': instance.stats?.toJson(),
      'tags': instance.tags.map((e) => e.toJson()).toList(),
    };

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      listeners: json['listeners'] as String,
      playcount: json['playcount'] as String,
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'listeners': instance.listeners,
      'playcount': instance.playcount,
    };
