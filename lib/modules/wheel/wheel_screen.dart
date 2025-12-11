import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import 'package:vehicle_rental_app/modules/wheel/wheel_sample_data.dart';
import 'package:vehicle_rental_app/widgets/custom_radio_tile.dart';

import '../../widgets/bottom_button_layout.dart';
import '../../widgets/custom_button.dart';

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
          child: _radioGroupLayout(),
        ),
      ),
      bottomNavigationBar: bottomButtonLayout(
        context: appContext,
        customButtons: customButtons,
        onClick: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const WheelScreen()),
          );
        },
      ),
    );
  }

  void _initialiseViews() {
    customButtons = CustomButtons(appContext);
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
