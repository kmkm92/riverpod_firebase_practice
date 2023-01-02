// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo2_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo2 _$$_Todo2FromJson(Map<String, dynamic> json) => _$_Todo2(
      id: json['id'] as String,
      category: json['category'] as String,
      text: json['text'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_Todo2ToJson(_$_Todo2 instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'text': instance.text,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
