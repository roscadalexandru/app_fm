// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      name: json['name'] as String,
      artist: Track._fromJsonToArtist(json['artist']),
      album: Track._fromJsonToAlbum(json['album']),
      listeners: json['listeners'] as String?,
      mbid: json['mbid'] as String?,
      url: json['url'] as String?,
      image: Image.fromJsonToImages(json['image']),
      rank: Track._fromJsonToRank(json['@attr']),
      duration: Track._fromJsonToDuration(json['duration']),
      tags: Tag.fromJsonToTags(json['toptags']),
      summary: Track._fromJsonToSummary(json['wiki']),
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'name': instance.name,
      'listeners': instance.listeners,
      'mbid': instance.mbid,
      'url': instance.url,
      'image': instance.image.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
      '@attr': instance.rank,
      'artist': instance.artist.toJson(),
      'album': instance.album?.toJson(),
      'toptags': instance.tags.map((e) => e.toJson()).toList(),
      'wiki': instance.summary,
    };
