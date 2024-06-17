import 'package:flutter/material.dart';

hSpace({double mHeight = 15}) {
  return SizedBox(
    height: mHeight,
  );
}

wSpace({double mWidth = 20}) {
  return SizedBox(
    width: mWidth,
  );
}

/// Custom fonts custom button fonts size forget password
TextStyle textStyleFonts11(BuildContext context, {colors = Colors.black}) {
  return Theme.of(context).textTheme.labelLarge!.copyWith(
        color: colors,
        fontWeight: FontWeight.w500,
        fontSize: 11,
      );
}

/// Custom fonts custom button fonts size forget password
TextStyle textStyleFonts14(BuildContext context, {colors = Colors.black}) {
  return Theme.of(context).textTheme.labelLarge!.copyWith(
        color: colors,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
}

/// Custom fonts custom button fonts size forget password
TextStyle textStyleFonts16(BuildContext context, {colors = Colors.black}) {
  return Theme.of(context).textTheme.headlineLarge!.copyWith(
        color: colors,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
}

TextStyle textStyleFonts18(BuildContext context, {colors = Colors.black}) {
  return Theme.of(context).textTheme.headlineLarge!.copyWith(
        color: colors,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
}

TextStyle textStyleFonts20(BuildContext context, {colors = Colors.black}) {
  return Theme.of(context)
      .textTheme
      .headlineMedium!
      .copyWith(color: colors, fontWeight: FontWeight.bold, fontSize: 20);
}

TextStyle textStyleFonts28(BuildContext context, {colors = Colors.black}) {
  return Theme.of(context)
      .textTheme
      .headlineMedium!
      .copyWith(color: colors, fontWeight: FontWeight.bold, fontSize: 28);
}
