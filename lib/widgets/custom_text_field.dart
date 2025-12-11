import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import '../core/resources/custom_color.dart';

class CustomTextFields {
  final BuildContext appContext;

  CustomTextFields(this.appContext);

  Widget customisedTextField({
    required String label,
    required TextEditingController controller,
    String? hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        SizedBox(height: appContext.heightPct(2)),
        SizedBox(
          height: appContext.heightPct(6.5),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: appContext.heightPct(4),
                horizontal: appContext.widthPct(4),
              ),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColor.secondaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColor.primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ]
    );
  }
}

