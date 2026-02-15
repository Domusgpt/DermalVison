// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String,
      role: $enumDecode(_$ChatRoleEnumMap, json['role']),
      text: json['text'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$ChatRoleEnumMap[instance.role]!,
      'text': instance.text,
      'createdAt': instance.createdAt.toIso8601String(),
      'imageUrls': instance.imageUrls,
    };

const _$ChatRoleEnumMap = {
  ChatRole.user: 'user',
  ChatRole.model: 'model',
  ChatRole.system: 'system',
};
