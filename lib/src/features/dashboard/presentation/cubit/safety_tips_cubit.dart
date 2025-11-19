import 'package:bloc/bloc.dart';
import 'package:emergen_sync/src/features/dashboard/data/safety_tips_repository.dart';
import 'package:emergen_sync/src/features/models/safety_tip_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_tips_state.dart';
part 'safety_tips_cubit.freezed.dart';

class SafetyTipsCubit extends Cubit<SafetyTipsState> {
  final SafetyTipsRepository _safetyTipsRepository;

  SafetyTipsCubit(this._safetyTipsRepository) : super(const SafetyTipsState.initial());

  void getSafetyTips() async {
    emit(const SafetyTipsState.loading());
    try {
      final safetyTips = await _safetyTipsRepository.getSafetyTips();
      emit(SafetyTipsState.loaded(safetyTips));
    } catch (e) {
      emit(SafetyTipsState.error(e.toString()));
    }
  }
}
