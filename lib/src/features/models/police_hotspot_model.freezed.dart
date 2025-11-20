// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'police_hotspot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoliceHotspotModel _$PoliceHotspotModelFromJson(Map<String, dynamic> json) {
  return _PoliceHotspotModel.fromJson(json);
}

/// @nodoc
mixin _$PoliceHotspotModel {
  String get name => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint get location => throw _privateConstructorUsedError;

  /// Serializes this PoliceHotspotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoliceHotspotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoliceHotspotModelCopyWith<PoliceHotspotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoliceHotspotModelCopyWith<$Res> {
  factory $PoliceHotspotModelCopyWith(
          PoliceHotspotModel value, $Res Function(PoliceHotspotModel) then) =
      _$PoliceHotspotModelCopyWithImpl<$Res, PoliceHotspotModel>;
  @useResult
  $Res call({String name, @GeoPointConverter() GeoPoint location});
}

/// @nodoc
class _$PoliceHotspotModelCopyWithImpl<$Res, $Val extends PoliceHotspotModel>
    implements $PoliceHotspotModelCopyWith<$Res> {
  _$PoliceHotspotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoliceHotspotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoliceHotspotModelImplCopyWith<$Res>
    implements $PoliceHotspotModelCopyWith<$Res> {
  factory _$$PoliceHotspotModelImplCopyWith(_$PoliceHotspotModelImpl value,
          $Res Function(_$PoliceHotspotModelImpl) then) =
      __$$PoliceHotspotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @GeoPointConverter() GeoPoint location});
}

/// @nodoc
class __$$PoliceHotspotModelImplCopyWithImpl<$Res>
    extends _$PoliceHotspotModelCopyWithImpl<$Res, _$PoliceHotspotModelImpl>
    implements _$$PoliceHotspotModelImplCopyWith<$Res> {
  __$$PoliceHotspotModelImplCopyWithImpl(_$PoliceHotspotModelImpl _value,
      $Res Function(_$PoliceHotspotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoliceHotspotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? location = null,
  }) {
    return _then(_$PoliceHotspotModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoliceHotspotModelImpl implements _PoliceHotspotModel {
  const _$PoliceHotspotModelImpl(
      {required this.name, @GeoPointConverter() required this.location});

  factory _$PoliceHotspotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoliceHotspotModelImplFromJson(json);

  @override
  final String name;
  @override
  @GeoPointConverter()
  final GeoPoint location;

  @override
  String toString() {
    return 'PoliceHotspotModel(name: $name, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoliceHotspotModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, location);

  /// Create a copy of PoliceHotspotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoliceHotspotModelImplCopyWith<_$PoliceHotspotModelImpl> get copyWith =>
      __$$PoliceHotspotModelImplCopyWithImpl<_$PoliceHotspotModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoliceHotspotModelImplToJson(
      this,
    );
  }
}

abstract class _PoliceHotspotModel implements PoliceHotspotModel {
  const factory _PoliceHotspotModel(
          {required final String name,
          @GeoPointConverter() required final GeoPoint location}) =
      _$PoliceHotspotModelImpl;

  factory _PoliceHotspotModel.fromJson(Map<String, dynamic> json) =
      _$PoliceHotspotModelImpl.fromJson;

  @override
  String get name;
  @override
  @GeoPointConverter()
  GeoPoint get location;

  /// Create a copy of PoliceHotspotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoliceHotspotModelImplCopyWith<_$PoliceHotspotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
