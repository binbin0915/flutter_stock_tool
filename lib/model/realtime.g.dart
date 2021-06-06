// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealtimeList _$RealtimeListFromJson(Map<String, dynamic> json) {
  return RealtimeList(
    (json['data'] as List<dynamic>?)
        ?.map((e) => RealtimeData.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['errorCode'] as int?,
    json['errorDescription'] as String?,
  );
}

Map<String, dynamic> _$RealtimeListToJson(RealtimeList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorDescription': instance.errorDescription,
    };
