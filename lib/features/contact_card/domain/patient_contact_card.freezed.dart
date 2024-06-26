// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_contact_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientContactCard {
  String? get name => throw _privateConstructorUsedError;
  String? get cprNumber => throw _privateConstructorUsedError;
  ContactReasonCard get contactReasonCard => throw _privateConstructorUsedError;
  List<Finding> get findings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientContactCardCopyWith<PatientContactCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientContactCardCopyWith<$Res> {
  factory $PatientContactCardCopyWith(
          PatientContactCard value, $Res Function(PatientContactCard) then) =
      _$PatientContactCardCopyWithImpl<$Res, PatientContactCard>;
  @useResult
  $Res call(
      {String? name,
      String? cprNumber,
      ContactReasonCard contactReasonCard,
      List<Finding> findings});
}

/// @nodoc
class _$PatientContactCardCopyWithImpl<$Res, $Val extends PatientContactCard>
    implements $PatientContactCardCopyWith<$Res> {
  _$PatientContactCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? cprNumber = freezed,
    Object? contactReasonCard = null,
    Object? findings = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cprNumber: freezed == cprNumber
          ? _value.cprNumber
          : cprNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      contactReasonCard: null == contactReasonCard
          ? _value.contactReasonCard
          : contactReasonCard // ignore: cast_nullable_to_non_nullable
              as ContactReasonCard,
      findings: null == findings
          ? _value.findings
          : findings // ignore: cast_nullable_to_non_nullable
              as List<Finding>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientContactCardImplCopyWith<$Res>
    implements $PatientContactCardCopyWith<$Res> {
  factory _$$PatientContactCardImplCopyWith(_$PatientContactCardImpl value,
          $Res Function(_$PatientContactCardImpl) then) =
      __$$PatientContactCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? cprNumber,
      ContactReasonCard contactReasonCard,
      List<Finding> findings});
}

/// @nodoc
class __$$PatientContactCardImplCopyWithImpl<$Res>
    extends _$PatientContactCardCopyWithImpl<$Res, _$PatientContactCardImpl>
    implements _$$PatientContactCardImplCopyWith<$Res> {
  __$$PatientContactCardImplCopyWithImpl(_$PatientContactCardImpl _value,
      $Res Function(_$PatientContactCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? cprNumber = freezed,
    Object? contactReasonCard = null,
    Object? findings = null,
  }) {
    return _then(_$PatientContactCardImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cprNumber: freezed == cprNumber
          ? _value.cprNumber
          : cprNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      contactReasonCard: null == contactReasonCard
          ? _value.contactReasonCard
          : contactReasonCard // ignore: cast_nullable_to_non_nullable
              as ContactReasonCard,
      findings: null == findings
          ? _value._findings
          : findings // ignore: cast_nullable_to_non_nullable
              as List<Finding>,
    ));
  }
}

/// @nodoc

class _$PatientContactCardImpl extends _PatientContactCard {
  const _$PatientContactCardImpl(
      {this.name,
      this.cprNumber,
      required this.contactReasonCard,
      final List<Finding> findings = const []})
      : _findings = findings,
        super._();

  @override
  final String? name;
  @override
  final String? cprNumber;
  @override
  final ContactReasonCard contactReasonCard;
  final List<Finding> _findings;
  @override
  @JsonKey()
  List<Finding> get findings {
    if (_findings is EqualUnmodifiableListView) return _findings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_findings);
  }

  @override
  String toString() {
    return 'PatientContactCard(name: $name, cprNumber: $cprNumber, contactReasonCard: $contactReasonCard, findings: $findings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientContactCardImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cprNumber, cprNumber) ||
                other.cprNumber == cprNumber) &&
            (identical(other.contactReasonCard, contactReasonCard) ||
                other.contactReasonCard == contactReasonCard) &&
            const DeepCollectionEquality().equals(other._findings, _findings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, cprNumber,
      contactReasonCard, const DeepCollectionEquality().hash(_findings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientContactCardImplCopyWith<_$PatientContactCardImpl> get copyWith =>
      __$$PatientContactCardImplCopyWithImpl<_$PatientContactCardImpl>(
          this, _$identity);
}

abstract class _PatientContactCard extends PatientContactCard {
  const factory _PatientContactCard(
      {final String? name,
      final String? cprNumber,
      required final ContactReasonCard contactReasonCard,
      final List<Finding> findings}) = _$PatientContactCardImpl;
  const _PatientContactCard._() : super._();

  @override
  String? get name;
  @override
  String? get cprNumber;
  @override
  ContactReasonCard get contactReasonCard;
  @override
  List<Finding> get findings;
  @override
  @JsonKey(ignore: true)
  _$$PatientContactCardImplCopyWith<_$PatientContactCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
