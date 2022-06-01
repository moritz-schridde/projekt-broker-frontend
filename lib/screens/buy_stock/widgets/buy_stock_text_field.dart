import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';

class BuyStockTextField extends StatelessWidget {
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String suffixIcon;
  final Function(String)? onSubmitted;

  const BuyStockTextField({
    Key? key,
    this.controller,
    this.inputFormatters,
    this.hintText,
    required this.suffixIcon,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      style: theme.textTheme.headline3,
      cursorColor: UiTheme.textColorBlack,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        //TODO empty text when focus (FocusNode)
        hintText: hintText,
        hintStyle: theme.textTheme.headline4?.copyWith(
          color: UiTheme.secondaryColor,
        ),
        suffixIcon: Text(
          suffixIcon,
          style: theme.textTheme.headline3?.copyWith(
            color: UiTheme.primaryColor,
          ),
        ),
        constraints: const BoxConstraints(
          minWidth: 100,
          // maxWidth: 160,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 80,
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(2.0),
      ),
      onSubmitted: onSubmitted,
    );
  }
}
