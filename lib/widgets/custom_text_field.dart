import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import '../core/resources/custom_color.dart';

class CustomTextFields {
  final BuildContext appContext;

  CustomTextFields(this.appContext);

  Widget customisedTextField({
    required String? label,
    required String? hintTxt,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? ""),
        SizedBox(height: appContext.heightPct(1)),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintTxt,
            contentPadding: EdgeInsets.symmetric(
              vertical: appContext.heightPct(2),
              horizontal: appContext.widthPct(2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(appContext.widthPct(3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColor.secondaryColor),
              borderRadius: BorderRadius.circular(appContext.widthPct(3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColor.primaryColor),
              borderRadius: BorderRadius.circular(appContext.widthPct(3)),
            ),
            errorMaxLines: 2,
          ),
        ),
      ],
    );
  }
}


