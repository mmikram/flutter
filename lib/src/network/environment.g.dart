// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnvironmentImpl _$$EnvironmentImplFromJson(Map<String, dynamic> json) =>
    _$EnvironmentImpl(
      baseUrl: json['baseUrl'] as String,
      appId: json['appId'] as String,
      publicRSALogin: json['publicRSALogin'] as String,
      publicRSA: json['publicRSA'] as String,
    );

Map<String, dynamic> _$$EnvironmentImplToJson(_$EnvironmentImpl instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'appId': instance.appId,
      'publicRSALogin': instance.publicRSALogin,
      'publicRSA': instance.publicRSA,
    };
