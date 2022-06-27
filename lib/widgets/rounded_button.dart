import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';

class RoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget label;
  final double? width;
  final double? height;
  RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            if (onPressed != null) ...[
              UiTheme.primaryGradientEnd,
              UiTheme.primaryGradientStart,
            ],
            if (onPressed == null) ...[
              Colors.black45,
              Colors.black12,
            ]
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: label,
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }
}
