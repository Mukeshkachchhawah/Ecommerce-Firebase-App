import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import 'color_code.dart';

//// show message in ui
class Utils {
  /// textfield auto next fild change
  static void fieldFocusChagne(
      BuildContext context, FocusNode currentNode, FocusNode nexFocus) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nexFocus);
  }

// ui button tab show snackbar message
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: AppColors.defaultColor);
  }

// ui button tab show snackbar message
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Curves.easeInExpo,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          borderRadius: BorderRadius.circular(10),
          padding: const EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          positionOffset: 20,
          duration: const Duration(seconds: 3),
        )..show(context));
  }

// ui button tab show snackbar message
  static void flushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Curves.easeInExpo,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          borderRadius: BorderRadius.circular(10),
          padding: const EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundColor: Colors.green,
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          positionOffset: 20,
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  /// show sank bar message in bottom bar
  static sankBarMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: AppColors.defaultColor,
    ));
  }
}
