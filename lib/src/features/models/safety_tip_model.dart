import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_tip_model.freezed.dart';
part 'safety_tip_model.g.dart';

@freezed
class SafetyTipModel with _$SafetyTipModel {
  const factory SafetyTipModel({
    required String title,
    required String description,
    required String image,
  }) = _SafetyTipModel;

  factory SafetyTipModel.fromJson(Map<String, dynamic> json) => _$SafetyTipModelFromJson(json);
}
