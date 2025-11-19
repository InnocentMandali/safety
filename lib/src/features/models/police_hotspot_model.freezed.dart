// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'police_hotspot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PoliceHotspotModel {

 String get name; GeoPoint get location;
/// Create a copy of PoliceHotspotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoliceHotspotModelCopyWith<PoliceHotspotModel> get copyWith => _$PoliceHotspotModelCopyWithImpl<PoliceHotspotModel>(this as PoliceHotspotModel, _$identity);

  /// Serializes this PoliceHotspotModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoliceHotspotModel&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,location);

@override
String toString() {
  return 'PoliceHotspotModel(name: $name, location: $location)';
}


}

/// @nodoc
abstract mixin class $PoliceHotspotModelCopyWith<$Res>  {
  factory $PoliceHotspotModelCopyWith(PoliceHotspotModel value, $Res Function(PoliceHotspotModel) _then) = _$PoliceHotspotModelCopyWithImpl;
@useResult
$Res call({
 String name, GeoPoint location
});




}
/// @nodoc
class _$PoliceHotspotModelCopyWithImpl<$Res>
    implements $PoliceHotspotModelCopyWith<$Res> {
  _$PoliceHotspotModelCopyWithImpl(this._self, this._then);

  final PoliceHotspotModel _self;
  final $Res Function(PoliceHotspotModel) _then;

/// Create a copy of PoliceHotspotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? location = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,
  ));
}

}


/// Adds pattern-matching-related methods to [PoliceHotspotModel].
extension PoliceHotspotModelPatterns on PoliceHotspotModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PoliceHotspotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PoliceHotspotModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PoliceHotspotModel value)  $default,){
final _that = this;
switch (_that) {
case _PoliceHotspotModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PoliceHotspotModel value)?  $default,){
final _that = this;
switch (_that) {
case _PoliceHotspotModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  GeoPoint location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PoliceHotspotModel() when $default != null:
return $default(_that.name,_that.location);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  GeoPoint location)  $default,) {final _that = this;
switch (_that) {
case _PoliceHotspotModel():
return $default(_that.name,_that.location);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  GeoPoint location)?  $default,) {final _that = this;
switch (_that) {
case _PoliceHotspotModel() when $default != null:
return $default(_that.name,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PoliceHotspotModel implements PoliceHotspotModel {
  const _PoliceHotspotModel({required this.name, required this.location});
  factory _PoliceHotspotModel.fromJson(Map<String, dynamic> json) => _$PoliceHotspotModelFromJson(json);

@override final  String name;
@override final  GeoPoint location;

/// Create a copy of PoliceHotspotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PoliceHotspotModelCopyWith<_PoliceHotspotModel> get copyWith => __$PoliceHotspotModelCopyWithImpl<_PoliceHotspotModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PoliceHotspotModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PoliceHotspotModel&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,location);

@override
String toString() {
  return 'PoliceHotspotModel(name: $name, location: $location)';
}


}

/// @nodoc
abstract mixin class _$PoliceHotspotModelCopyWith<$Res> implements $PoliceHotspotModelCopyWith<$Res> {
  factory _$PoliceHotspotModelCopyWith(_PoliceHotspotModel value, $Res Function(_PoliceHotspotModel) _then) = __$PoliceHotspotModelCopyWithImpl;
@override @useResult
$Res call({
 String name, GeoPoint location
});




}
/// @nodoc
class __$PoliceHotspotModelCopyWithImpl<$Res>
    implements _$PoliceHotspotModelCopyWith<$Res> {
  __$PoliceHotspotModelCopyWithImpl(this._self, this._then);

  final _PoliceHotspotModel _self;
  final $Res Function(_PoliceHotspotModel) _then;

/// Create a copy of PoliceHotspotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? location = null,}) {
  return _then(_PoliceHotspotModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,
  ));
}


}

// dart format on
