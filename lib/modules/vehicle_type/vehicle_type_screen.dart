import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import 'package:vehicle_rental_app/core/resources/string.dart';
import 'package:vehicle_rental_app/modules/vehicle_type/vehicle_type_sample_data.dart';

import '../../widgets/bottom_button_layout.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_radio_tile.dart';


class VehicleTypeScreen extends StatefulWidget {
  const VehicleTypeScreen({super.key});

  @override
  State<VehicleTypeScreen> createState() => _VehicleTypeScreenState();
}

class _VehicleTypeScreenState extends State<VehicleTypeScreen> {
  late BuildContext appContext;
  late CustomButtons customButtons;

  int? selectedVehicleId;

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
        onClick: () {
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
          AppStrings.vehicleTypeTitle,
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
      vehicleTypeOptions.map((option) {
        return CustomRadioTile<int>(
          value: option.id,
          groupValue: selectedVehicleId,
          title: option.label,
          onTap: () {
            setState(() => selectedVehicleId = option.id);
          },
        );
      }).toList(),
    );
  }
}
