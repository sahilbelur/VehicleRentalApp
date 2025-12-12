import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import 'package:vehicle_rental_app/core/resources/string.dart';
import 'package:vehicle_rental_app/widgets/bottom_button_layout.dart';
import 'package:vehicle_rental_app/widgets/custom_button.dart';

import '../../core/resources/app_validator.dart';
import '../../widgets/custom_text_field.dart';
import '../view_model/booking_view_model.dart';
import '../wheel/wheel_screen.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late BuildContext appContext;
  late CustomTextFields customTextFields;
  late CustomButtons customButtons;

  final _formKey = GlobalKey<FormState>();
  late var vm;

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
          child: Form(key: _formKey, child: _mainView()),
        ),
      ),
      bottomNavigationBar: bottomButtonLayout(
        context: appContext,
        customButtons: customButtons,
        onClick: () {
          _navigateToNextScreen();
        },
      ),
    );
  }

  void _initialiseViews() {
    customButtons = CustomButtons(appContext);
    customTextFields = CustomTextFields(appContext);
    vm = appContext.read<BookingViewModel>();
  }

  Widget _mainView() {
    return Column(
      children: [
        Text(
          AppStrings.nameScreenTitle,
          style: TextStyle(
            fontSize: appContext.textLargeTitle_20(),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: appContext.heightPct(2)),
        Expanded(child: _textFieldLayout()),
      ],
    );
  }

  Widget _textFieldLayout() {
    return Column(
      children: [
        customTextFields.customisedTextField(
          label: AppStrings.firstName,
          controller: firstNameController,
          validator: AppValidators.validateText,
          hintTxt: AppStrings.enterFirstName
        ),
        SizedBox(height: appContext.heightPct(1.5)),
        customTextFields.customisedTextField(
          label: AppStrings.lastName,
          controller: lastNameController,
          validator: AppValidators.validateText,
          hintTxt: AppStrings.enterLastName,
        ),
      ],
    );
  }

  void _navigateToNextScreen() {
    if (_formKey.currentState!.validate()) {
      vm.setPersonalDetails(
        firstNameController.text.trim(),
        lastNameController.text.trim(),
      );
      Navigator.push(
        appContext,
        MaterialPageRoute(builder: (_) => WheelScreen()),
      );
    }
  }
}
