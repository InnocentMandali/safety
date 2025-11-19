import 'package:bloc/bloc.dart';
import 'package:emergen_sync/src/features/dashboard/data/police_hotspot_repository.dart';
import 'package:emergen_sync/src/features/models/police_hotspot_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'police_hotspot_state.dart';
part 'police_hotspot_cubit.freezed.dart';

class PoliceHotspotCubit extends Cubit<PoliceHotspotState> {
  final PoliceHotspotRepository _policeHotspotRepository;

  PoliceHotspotCubit(this._policeHotspotRepository)
      : super(const PoliceHotspotState.initial());

  void getPoliceHotspots() async {
    emit(const PoliceHotspotState.loading());
    try {
      final policeHotspots = await _policeHotspotRepository.getPoliceHotspots();
      emit(PoliceHotspotState.loaded(policeHotspots));
    } catch (e) {
      emit(PoliceHotspotState.error(e.toString()));
    }
  }
}
