import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'police_hotspot_model.freezed.dart';
part 'police_hotspot_model.g.dart';

@freezed
class PoliceHotspotModel with _$PoliceHotspotModel {
  const factory PoliceHotspotModel({
    required String name,
    required GeoPoint location,
  }) = _PoliceHotspotModel;

  factory PoliceHotspotModel.fromJson(Map<String, dynamic> json) =>
      _$PoliceHotspotModelFromJson(json);
}
