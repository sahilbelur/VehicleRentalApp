import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import '../core/resources/custom_color.dart';

class CustomButtons {
  final BuildContext appContext;

  CustomButtons(this.appContext);

  Widget fullWidthButton({
    required String btnText,
    required VoidCallback? onPressed,
    double? height,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
  }) {

    final double btnHeight = height ?? appContext.heightPct(6);

    return SizedBox(
      width: double.infinity,
      height: btnHeight,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? CustomColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side:
              borderColor != null
                  ? BorderSide(color: borderColor, width: 1.5)
                  : BorderSide.none,
            ),
          ),
          child: Text(
              btnText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: appContext.textMedium_18(),
              fontWeight: FontWeight.bold,
              color: textColor ?? CustomColor.white
            ),
          )
      ),
    );
  }
}
