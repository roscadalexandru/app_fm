// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      name: json['name'] as String?,
      artist: json['artist'] as String?,
      listeners: json['listeners'] as String?,
      mbid: json['mbid'] as String?,
      url: json['url'] as String?,
      streamable: json['streamable'] as String?,
      image: (json['image'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'name': instance.name,
      'artist': instance.artist,
      'listeners': instance.listeners,
      'mbid': instance.mbid,
      'url': instance.url,
      'streamable': instance.streamable,
      'image': instance.image.map((e) => e.toJson()).toList(),
    };
