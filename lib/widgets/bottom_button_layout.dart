import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import '../core/resources/string.dart';
import 'custom_button.dart';

Widget bottomButtonLayout({
  required BuildContext context,
  CustomButtons? customButtons,
  required VoidCallback? onClick,
  String? btnText,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: context.marginDimen(),
      vertical: context.heightPct(1),
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1))],
    ),
    child: customButtons?.fullWidthButton(
      btnText: btnText ?? AppStrings.next,
      onPressed: onClick,
    ),
  );
}
