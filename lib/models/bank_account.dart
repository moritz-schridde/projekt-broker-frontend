import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'bank_account.g.dart';

@JsonSerializable()
@CopyWith()
class BankAccount {
  final String kontoId;
  final String name;
  final String surname;
  final String taxNumber;
  final String iban;
  final String bic;

  BankAccount({
    required this.kontoId,
    required this.name,
    required this.surname,
    required this.taxNumber,
    required this.iban,
    required this.bic,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);

  get toJson => _$BankAccountToJson(this);
}
