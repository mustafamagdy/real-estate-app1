import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

AppBar buildMainAppBar(BuildContext context, {required Color color}) {
  final iconColor = color == Colors.white ? kTextColor : Colors.white70;
  return AppBar(
    backgroundColor: color,
    elevation: 0,
    leading: IconButton(
      splashColor: Colors.transparent,
      onPressed: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      },
      icon: SvgPicture.asset(
        'assets/icons/back.svg',
        color: iconColor,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/search.svg',
          color: iconColor,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/cart.svg',
          color: iconColor,
        ),
      ),
      const SizedBox(width: kDefaultPadding / 2),
    ],
  );
}
