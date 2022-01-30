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
  final double borderRadius;
  const AppButton({
    Key? key,
    this.text,
    this.icon,
    this.borderColor,
    this.shallow = false,
    this.height = 30,
    this.borderRadius = 5,
    required this.color,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = text != null
        ? Text(
            text!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          )
        : Icon(icon!, color: color);

    return InkWell(
      splashColor: shallow ? Colors.white : borderColor ?? color,
      onTap: onPress,
      child: Container(
        height: height,
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
