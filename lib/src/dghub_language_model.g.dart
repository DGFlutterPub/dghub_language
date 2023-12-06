// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dghub_language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGHubLanguageModel _$DGHubLanguageModelFromJson(Map<String, dynamic> json) =>
    DGHubLanguageModel(
      id: json['id'] as String,
      data: json['data'] as Map<String, String>?,
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$DGHubLanguageModelToJson(DGHubLanguageModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
