import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import 'package:vehicle_rental_app/core/resources/string.dart';
import 'package:vehicle_rental_app/widgets/custom_button.dart';

import '../widgets/custom_text_field.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late BuildContext appContext;
  late CustomTextFields customTextFields;
  late CustomButtons customButtons;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    appContext = context;
    _initialiseViews();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: appContext.widthPct(1),
            vertical: appContext.heightPct(8),
          ),
          child: _textFieldLayout(),
        ),
      ),
        bottomNavigationBar: _bottomLayout(),
    );
  }
  void _initialiseViews() {
    customButtons = CustomButtons(appContext);
    customTextFields = CustomTextFields(appContext);
  }

  Widget _textFieldLayout() {
    return Column(
      children: [
        customTextFields.customisedTextField(
            label: AppStrings.firstName,
            controller: firstNameController
        ),
        SizedBox(height: appContext.heightPct(1.5)),
        customTextFields.customisedTextField(
            label: AppStrings.lastName,
            controller: lastNameController
        )
      ],
    );
  }

  Widget _bottomLayout() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: appContext.marginDimen(),
        vertical: appContext.heightPct(1),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: customButtons.fullWidthButton(
          btnText: AppStrings.next,
          onPressed: (){}
      ),
    );
  }
}
