part of 'police_hotspot_cubit.dart';

@freezed
class PoliceHotspotState with _$PoliceHotspotState {
  const factory PoliceHotspotState.initial() = _Initial;
  const factory PoliceHotspotState.loading() = _Loading;
  const factory PoliceHotspotState.loaded(
      List<PoliceHotspotModel> policeHotspots) = _Loaded;
  const factory PoliceHotspotState.error(String message) = _Error;
}
