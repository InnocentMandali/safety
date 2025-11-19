part of 'safety_tips_cubit.dart';

@freezed
class SafetyTipsState with _$SafetyTipsState {
  const factory SafetyTipsState.initial() = _Initial;
  const factory SafetyTipsState.loading() = _Loading;
  const factory SafetyTipsState.loaded(List<SafetyTipModel> safetyTips) = _Loaded;
  const factory SafetyTipsState.error(String message) = _Error;
}
