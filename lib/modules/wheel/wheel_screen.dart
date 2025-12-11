import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import 'package:vehicle_rental_app/modules/vehicle_type/vehicle_type_screen.dart';
import 'package:vehicle_rental_app/widgets/custom_radio_tile.dart';

import '../../core/resources/string.dart';
import '../../widgets/bottom_button_layout.dart';
import '../../widgets/custom_button.dart';
import '../vehicle_type_sample_data.dart';

class WheelScreen extends StatefulWidget {
  const WheelScreen({super.key});

  @override
  State<WheelScreen> createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {
  late BuildContext appContext;
  late CustomButtons customButtons;

  int? selectedWheelId;

  @override
  Widget build(BuildContext context) {
    appContext = context;
    _initialiseViews();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: appContext.widthPct(1),
            vertical: appContext.heightPct(8),
          ),
          child: _mainView(),
        ),
      ),
      bottomNavigationBar: bottomButtonLayout(
        context: appContext,
        customButtons: customButtons,
        onClick: selectedWheelId == null
            ? null
            : () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const VehicleTypeScreen()),
          );
        },
      ),
    );
  }

  void _initialiseViews() {
    customButtons = CustomButtons(appContext);
  }

  Widget _mainView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.wheelScreenTitle,
          style: TextStyle(
            fontSize: appContext.textLargeTitle_20(),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: appContext.heightPct(2)),
        Expanded(
          child: _radioGroupLayout(),
        ),
      ],
    );
  }

  Widget _radioGroupLayout() {
    return Column(
      children:
          wheelOptions.map((option) {
            return CustomRadioTile<int>(
              value: option.id,
              groupValue: selectedWheelId,
              title: option.label,
              onTap: () {
                setState(() => selectedWheelId = option.id);
              },
            );
          }).toList(),
    );
  }
}
