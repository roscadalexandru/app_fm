// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackInfo _$TrackInfoFromJson(Map<String, dynamic> json) => TrackInfo(
      name: json['name'] as String?,
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
      listeners: json['listeners'] as String?,
      mbid: json['mbid'] as String?,
      url: json['url'] as String?,
      streamable: json['streamable'],
      image: (json['image'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      attr: json['@attr'],
      duration: json['duration'] as int?,
    );

Map<String, dynamic> _$TrackInfoToJson(TrackInfo instance) => <String, dynamic>{
      'name': instance.name,
      'artist': instance.artist?.toJson(),
      'listeners': instance.listeners,
      'mbid': instance.mbid,
      'url': instance.url,
      'streamable': instance.streamable,
      'duration': instance.duration,
      '@attr': instance.attr,
      'image': instance.image.map((e) => e.toJson()).toList(),
    };
