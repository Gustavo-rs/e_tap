import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppSnackbar {
  static void success(BuildContext context, String text) {
    showTopSnackBar(
      context,
      SizedBox(
        height: 56,
        child: CustomSnackBar.success(
          backgroundColor: Colors.green,
          iconPositionLeft: 10,
          iconRotationAngle: -10,
          iconPositionTop: -30,
          message: text,
        ),
      ),
      animationDuration: const Duration(milliseconds: 2000),
      displayDuration: const Duration(milliseconds: 100),
    );
  }

  static void error(BuildContext context, String text) {
    showTopSnackBar(
      context,
      SizedBox(
        height: 56,
        child: CustomSnackBar.error(
          iconPositionLeft: 10,
          iconRotationAngle: -10,
          iconPositionTop: -30,
          message: text,
        ),
      ),
      animationDuration: const Duration(milliseconds: 2000),
      displayDuration: const Duration(milliseconds: 100),
    );
  }
}
