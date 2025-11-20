// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'police_hotspot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoliceHotspotModelImpl _$$PoliceHotspotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PoliceHotspotModelImpl(
      name: json['name'] as String,
      location:
          const GeoPointConverter().fromJson(json['location'] as GeoPoint),
    );

Map<String, dynamic> _$$PoliceHotspotModelImplToJson(
        _$PoliceHotspotModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': const GeoPointConverter().toJson(instance.location),
    };
