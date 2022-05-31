// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BankAccountCWProxy {
  BankAccount bic(String bic);

  BankAccount iban(String iban);

  BankAccount kontoId(String kontoId);

  BankAccount name(String name);

  BankAccount surname(String surname);

  BankAccount taxNumber(String taxNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BankAccount(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BankAccount(...).copyWith(id: 12, name: "My name")
  /// ````
  BankAccount call({
    String? bic,
    String? iban,
    String? kontoId,
    String? name,
    String? surname,
    String? taxNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBankAccount.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBankAccount.copyWith.fieldName(...)`
class _$BankAccountCWProxyImpl implements _$BankAccountCWProxy {
  final BankAccount _value;

  const _$BankAccountCWProxyImpl(this._value);

  @override
  BankAccount bic(String bic) => this(bic: bic);

  @override
  BankAccount iban(String iban) => this(iban: iban);

  @override
  BankAccount kontoId(String kontoId) => this(kontoId: kontoId);

  @override
  BankAccount name(String name) => this(name: name);

  @override
  BankAccount surname(String surname) => this(surname: surname);

  @override
  BankAccount taxNumber(String taxNumber) => this(taxNumber: taxNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BankAccount(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BankAccount(...).copyWith(id: 12, name: "My name")
  /// ````
  BankAccount call({
    Object? bic = const $CopyWithPlaceholder(),
    Object? iban = const $CopyWithPlaceholder(),
    Object? kontoId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? surname = const $CopyWithPlaceholder(),
    Object? taxNumber = const $CopyWithPlaceholder(),
  }) {
    return BankAccount(
      bic: bic == const $CopyWithPlaceholder() || bic == null
          ? _value.bic
          // ignore: cast_nullable_to_non_nullable
          : bic as String,
      iban: iban == const $CopyWithPlaceholder() || iban == null
          ? _value.iban
          // ignore: cast_nullable_to_non_nullable
          : iban as String,
      kontoId: kontoId == const $CopyWithPlaceholder() || kontoId == null
          ? _value.kontoId
          // ignore: cast_nullable_to_non_nullable
          : kontoId as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      surname: surname == const $CopyWithPlaceholder() || surname == null
          ? _value.surname
          // ignore: cast_nullable_to_non_nullable
          : surname as String,
      taxNumber: taxNumber == const $CopyWithPlaceholder() || taxNumber == null
          ? _value.taxNumber
          // ignore: cast_nullable_to_non_nullable
          : taxNumber as String,
    );
  }
}

extension $BankAccountCopyWith on BankAccount {
  /// Returns a callable class that can be used as follows: `instanceOfBankAccount.copyWith(...)` or like so:`instanceOfBankAccount.copyWith.fieldName(...)`.
  _$BankAccountCWProxy get copyWith => _$BankAccountCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      kontoId: json['kontoId'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      taxNumber: json['taxNumber'] as String,
      iban: json['iban'] as String,
      bic: json['bic'] as String,
    );

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'kontoId': instance.kontoId,
      'name': instance.name,
      'surname': instance.surname,
      'taxNumber': instance.taxNumber,
      'iban': instance.iban,
      'bic': instance.bic,
    };
