
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:emergen_sync/src/core/utils/json_converters.dart';

part 'police_hotspot_model.freezed.dart';
part 'police_hotspot_model.g.dart';

@freezed
abstract class PoliceHotspotModel with _$PoliceHotspotModel {
  const factory PoliceHotspotModel({
    required String name,
    @GeoPointConverter() required GeoPoint location,
  }) = _PoliceHotspotModel;

  factory PoliceHotspotModel.fromJson(Map<String, dynamic> json) =>
      _$PoliceHotspotModelFromJson(json);
}
