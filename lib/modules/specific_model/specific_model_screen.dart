import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_rental_app/modules/specific_model/vehicle_model.dart';
import '../../core/resources/responsive.dart';
import '../../core/resources/string.dart';
import '../../database/vehicle_repo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_button_layout.dart';
import '../reservation_list/reservation_list.dart';
import '../sample_data/vehicle_type_sample_data.dart';
import '../view_model/booking_view_model.dart';

class SpecificModelScreen extends StatefulWidget {
  final int? vehiclevehicleTypeId;

  const SpecificModelScreen({super.key, required this.vehiclevehicleTypeId});

  @override
  State<SpecificModelScreen> createState() => _SpecificModelScreenState();
}

class _SpecificModelScreenState extends State<SpecificModelScreen> {
  late BuildContext appContext;
  late CustomButtons customButtons;
  late var modelsToShow;
  late var vm;

  VehicleModel? selectedModel;

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
        onClick:
            selectedModel == null
                ? null
                : () {
                  _navigateToNextScreen();
                },
      ),
    );
  }

  void _initialiseViews() {
    customButtons = CustomButtons(appContext);
    modelsToShow =
        vehicleModels
            .where(
              (model) => model.vehicleTypeId == widget.vehiclevehicleTypeId,
            )
            .toList();
    vm = appContext.read<BookingViewModel>();
  }

  Widget _mainView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.modelTitle,
          style: TextStyle(
            fontSize: appContext.textLargeTitle_20(),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: appContext.heightPct(2)),
        Expanded(child: _vehicleListing()),
      ],
    );
  }

  Widget _vehicleListing() {
    return ListView.builder(
      itemCount: modelsToShow.length,
      itemBuilder: (_, index) {
        final model = modelsToShow[index];
        return Card(
          margin: EdgeInsets.symmetric(
            vertical: appContext.heightPct(1),
            horizontal: appContext.widthPct(2),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              vertical: appContext.heightPct(2),
              horizontal: appContext.widthPct(2),
            ),
            leading: Container(
              width: appContext.widthPct(20),
              height: appContext.widthPct(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(model.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              model.name,
              style: TextStyle(fontSize: appContext.textNormal_16()),
            ),
            trailing: Radio<VehicleModel>(
              value: model,
              groupValue: selectedModel,
              onChanged: (value) {
                setState(() => selectedModel = value);
              },
            ),
            onTap: () {
              setState(() {
                selectedModel = model;
              });
            },
          ),
        );
      },
    );
  }

  void _navigateToNextScreen() {
    vm.setVehicleDetails(
        vName: selectedModel!.name,
        vImage: selectedModel!.image,
    );
    _saveToDatabase();
    Navigator.push(
      appContext,
      MaterialPageRoute(builder: (_) => ReservationList()),
    );
  }

  void _saveToDatabase() async {
    if (vm.vehicleName == null) {
      print("Vehicle Saved: vehicle data missing!");
      return;
    }

    final data = {
      "vehicleName": vm.vehicleName,
      "vehicleType": vm.vehicleType,
      "vehicleImage": vm.vehicleImage,
      "name": "${vm.fname ?? ''} ${vm.lname ?? ''}",
    };

    final id = await VehicleRepository().insertSelectedVehicle(data);

    print("Vehicle Saved: id: $id | $data");

    final allVehicles = await VehicleRepository().fetchSelectedVehicles();
    for (var v in allVehicles) {
      print("Vehicle Saved: ID: ${v['id']}, Name: ${v['vehicleName']}, Type: ${v['vehicleType']}");
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Vehicle Saved: Vehicle saved successfully")),
    );
  }
}
