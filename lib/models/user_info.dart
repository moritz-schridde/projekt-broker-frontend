import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bank_account.dart';

part 'user_info.g.dart';

@JsonSerializable()
@CopyWith()
class UserInfo {
  final String name;
  final String surname;
  final String email;
  final String phone;
  final String street;
  final String number;
  final String postalcode;
  final String city;
  final String country;
  final String birthDay;
  final String birthMonth;
  final String birthYear;
  final BankAccount bankAccount;

  UserInfo({
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.street,
    required this.number,
    required this.postalcode,
    required this.city,
    required this.country,
    required this.birthDay,
    required this.birthMonth,
    required this.birthYear,
    required this.bankAccount,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  get toJson => _$UserInfoToJson(this);
}
