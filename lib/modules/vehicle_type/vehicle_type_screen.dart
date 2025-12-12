import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import 'package:vehicle_rental_app/core/resources/string.dart';
import 'package:vehicle_rental_app/modules/specific_model/specific_model_screen.dart';
import 'package:vehicle_rental_app/modules/sample_data/vehicle_type_sample_data.dart';
import 'package:vehicle_rental_app/modules/vehicle_type/vehicle_type_model.dart';

import '../../widgets/bottom_button_layout.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_radio_tile.dart';
import '../view_model/booking_view_model.dart';


class VehicleTypeScreen extends StatefulWidget {
  final int selectedWheelId;
  const VehicleTypeScreen({super.key, required this.selectedWheelId});

  @override
  State<VehicleTypeScreen> createState() => _VehicleTypeScreenState();
}

class _VehicleTypeScreenState extends State<VehicleTypeScreen> {
  late BuildContext appContext;
  late CustomButtons customButtons;

  VehicleTypeModel? selectedVehicleType;
  late List<VehicleTypeModel> filteredTypes;
  late var vm;

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
        onClick: selectedVehicleType == null
            ? null
            : () {
          _navigateToNextScreen();
        },
      ),
    );
  }

  void _initialiseViews() {
    customButtons = CustomButtons(appContext);
    filteredTypes = vehicleTypes
        .where((type) => type.wheelCount == widget.selectedWheelId)
        .toList();
    vm = appContext.read<BookingViewModel>();
  }

  Widget _mainView() {
    return Column(
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
      filteredTypes.map((type) {
        return CustomRadioTile<int>(
          value: type.id,
          groupValue: selectedVehicleType?.id,
          title: type.name,
          onTap: () {
            setState(() => selectedVehicleType = type);
          },
        );
      }).toList(),
    );
  }

  void _navigateToNextScreen() {
    vm.setVehicleDetails(
      vType: selectedVehicleType!.name,
    );
    Navigator.push(
      appContext,
      MaterialPageRoute(builder: (_) => SpecificModelScreen(vehiclevehicleTypeId: selectedVehicleType!.id)),
    );
  }
}
