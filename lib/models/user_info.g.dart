// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserInfoCWProxy {
  UserInfo bankAccount(BankAccount? bankAccount);

  UserInfo birthDay(String birthDay);

  UserInfo birthMonth(String birthMonth);

  UserInfo birthYear(String birthYear);

  UserInfo city(String city);

  UserInfo country(String country);

  UserInfo email(String email);

  UserInfo name(String name);

  UserInfo number(String number);

  UserInfo phone(String phone);

  UserInfo postalcode(String postalcode);

  UserInfo street(String street);

  UserInfo surname(String surname);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  UserInfo call({
    BankAccount? bankAccount,
    String? birthDay,
    String? birthMonth,
    String? birthYear,
    String? city,
    String? country,
    String? email,
    String? name,
    String? number,
    String? phone,
    String? postalcode,
    String? street,
    String? surname,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserInfo.copyWith.fieldName(...)`
class _$UserInfoCWProxyImpl implements _$UserInfoCWProxy {
  final UserInfo _value;

  const _$UserInfoCWProxyImpl(this._value);

  @override
  UserInfo bankAccount(BankAccount? bankAccount) =>
      this(bankAccount: bankAccount);

  @override
  UserInfo birthDay(String birthDay) => this(birthDay: birthDay);

  @override
  UserInfo birthMonth(String birthMonth) => this(birthMonth: birthMonth);

  @override
  UserInfo birthYear(String birthYear) => this(birthYear: birthYear);

  @override
  UserInfo city(String city) => this(city: city);

  @override
  UserInfo country(String country) => this(country: country);

  @override
  UserInfo email(String email) => this(email: email);

  @override
  UserInfo name(String name) => this(name: name);

  @override
  UserInfo number(String number) => this(number: number);

  @override
  UserInfo phone(String phone) => this(phone: phone);

  @override
  UserInfo postalcode(String postalcode) => this(postalcode: postalcode);

  @override
  UserInfo street(String street) => this(street: street);

  @override
  UserInfo surname(String surname) => this(surname: surname);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  UserInfo call({
    Object? bankAccount = const $CopyWithPlaceholder(),
    Object? birthDay = const $CopyWithPlaceholder(),
    Object? birthMonth = const $CopyWithPlaceholder(),
    Object? birthYear = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? postalcode = const $CopyWithPlaceholder(),
    Object? street = const $CopyWithPlaceholder(),
    Object? surname = const $CopyWithPlaceholder(),
  }) {
    return UserInfo(
      bankAccount: bankAccount == const $CopyWithPlaceholder()
          ? _value.bankAccount
          // ignore: cast_nullable_to_non_nullable
          : bankAccount as BankAccount?,
      birthDay: birthDay == const $CopyWithPlaceholder() || birthDay == null
          ? _value.birthDay
          // ignore: cast_nullable_to_non_nullable
          : birthDay as String,
      birthMonth:
          birthMonth == const $CopyWithPlaceholder() || birthMonth == null
              ? _value.birthMonth
              // ignore: cast_nullable_to_non_nullable
              : birthMonth as String,
      birthYear: birthYear == const $CopyWithPlaceholder() || birthYear == null
          ? _value.birthYear
          // ignore: cast_nullable_to_non_nullable
          : birthYear as String,
      city: city == const $CopyWithPlaceholder() || city == null
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String,
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      number: number == const $CopyWithPlaceholder() || number == null
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as String,
      phone: phone == const $CopyWithPlaceholder() || phone == null
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String,
      postalcode:
          postalcode == const $CopyWithPlaceholder() || postalcode == null
              ? _value.postalcode
              // ignore: cast_nullable_to_non_nullable
              : postalcode as String,
      street: street == const $CopyWithPlaceholder() || street == null
          ? _value.street
          // ignore: cast_nullable_to_non_nullable
          : street as String,
      surname: surname == const $CopyWithPlaceholder() || surname == null
          ? _value.surname
          // ignore: cast_nullable_to_non_nullable
          : surname as String,
    );
  }
}

extension $UserInfoCopyWith on UserInfo {
  /// Returns a callable class that can be used as follows: `instanceOfUserInfo.copyWith(...)` or like so:`instanceOfUserInfo.copyWith.fieldName(...)`.
  _$UserInfoCWProxy get copyWith => _$UserInfoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      street: json['street'] as String,
      number: json['number'] as String,
      postalcode: json['postalcode'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      birthDay: json['birthDay'] as String,
      birthMonth: json['birthMonth'] as String,
      birthYear: json['birthYear'] as String,
      bankAccount: json['bankAccount'] == null
          ? null
          : BankAccount.fromJson(json['bankAccount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone': instance.phone,
      'street': instance.street,
      'number': instance.number,
      'postalcode': instance.postalcode,
      'city': instance.city,
      'country': instance.country,
      'birthDay': instance.birthDay,
      'birthMonth': instance.birthMonth,
      'birthYear': instance.birthYear,
      'bankAccount': instance.bankAccount?.toJson,
    };
