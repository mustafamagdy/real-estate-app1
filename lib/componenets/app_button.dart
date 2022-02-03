import 'package:flutter/material.dart';

import 'package:realstate_app1/constants.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color color;
  final Color? borderColor;
  final bool shallow;
  final VoidCallback onPress;
  final double height;
  final double? width;
  final double borderRadius;
  final TextStyle? textStyle;
  const AppButton({
    Key? key,
    this.text,
    this.icon,
    required this.color,
    this.borderColor,
    this.shallow = false,
    required this.onPress,
    this.height = 30,
    this.width,
    this.borderRadius = 5,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = text != null
        ? Text(
            text!,
            style: textStyle ??
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          )
        : Icon(icon!, color: color);

    return InkWell(
      splashColor: shallow ? Colors.white : borderColor ?? color,
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: shallow ? Colors.white : borderColor ?? color,
            border: Border.all(
              color: borderColor ?? color,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(child: child),
      ),
    );
  }
}
