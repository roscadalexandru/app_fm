// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      name: json['name'] as String?,
      artist: json['artist'] as String?,
      url: json['url'] as String?,
      mbid: json['mbid'] as String?,
      image: (json['image'] as List<dynamic>?)
              ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      playcount: json['playcount'] as String?,
      tags: Tag.fromJsonToTags(json['tags']),
      tracks: Track.fromJsonToTracks(json['tracks']),
      wiki: json['wiki'],
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'name': instance.name,
      'artist': instance.artist,
      'url': instance.url,
      'mbid': instance.mbid,
      'image': instance.image.map((e) => e.toJson()).toList(),
      'playcount': instance.playcount,
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'wiki': instance.wiki,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
    };
