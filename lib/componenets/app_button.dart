import 'package:flutter/material.dart';
import 'package:realstate_app1/constants.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color color;
  final bool shallow;
  final VoidCallback onPress;
  const AppButton({
    Key? key,
    this.text,
    this.icon,
    required this.color,
    required this.onPress,
    this.shallow = false,
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
      splashColor: color,
      onTap: onPress,
      child: Container(
        height: text == null ? 55 : 30,
        padding: text != null ? EdgeInsets.symmetric(horizontal: 10) : null,
        decoration: BoxDecoration(
            color: shallow ? Colors.white : color,
            border: Border.all(
              color: color,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Center(child: child),
      ),
    );
  }
}
