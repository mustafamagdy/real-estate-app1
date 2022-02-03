import 'package:flutter/material.dart';
import '../constants.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    titleSpacing: kDefaultPadding / 4,
    leading: Padding(
      padding: const EdgeInsets.only(left: kDefaultPadding),
      child: InkWell(
        onTap: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: kTextColor,
        ),
      ),
    ),
    title: const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'House',
        style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
      ),
    ),
  );
}
