import 'package:e_commerece_clon/utils/ui_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  Icon icons;
  String text;
  VoidCallback onTap;
  CustomListTile(
      {super.key,
      required this.icons,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icons,
      title: Text(
        text,
        style: textStyleFonts14(context),
      ),
      onTap: onTap,
    );
  }
}
