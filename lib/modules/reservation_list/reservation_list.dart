import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_rental_app/core/resources/responsive.dart';
import 'package:vehicle_rental_app/core/resources/string.dart';
import 'package:vehicle_rental_app/widgets/custom_button.dart';

import '../../widgets/bottom_button_layout.dart';
import '../user_details/name_screen.dart';
import '../view_model/reservation_listing_view_model.dart';

class ReservationList extends StatelessWidget {
  const ReservationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReservationListViewModel()..loadVehicles(),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.widthPct(1),
                vertical: context.heightPct(8),
              ),
              child: _mainView(context),
            ),
          ),
          bottomNavigationBar: bottomButtonLayout(
            context: context,
            btnText: AppStrings.done,
            customButtons: CustomButtons(context),
            onClick: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => NameScreen()),
                (route) => false,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _mainView(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.savedVehiclesTitle,
          style: TextStyle(
            fontSize: context.textLargeTitle_20(),
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => NameScreen()),
                (route) => false,
              );
            },
          ),
        ),
        SizedBox(height: context.heightPct(2)),
        Expanded(child: _selectedVehicleListView()),
      ],
    );
  }

  Widget _selectedVehicleListView() {
    return Consumer<ReservationListViewModel>(
      builder: (context, vm, _) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (vm.vehicles.isEmpty) {
          return const Center(child: Text(AppStrings.noSavedVehicle));
        }

        return ListView.builder(
          itemCount: vm.vehicles.length,
          itemBuilder: (context, index) {
            final v = vm.vehicles[index];

            return Card(
              margin: EdgeInsets.all(context.marginDimen()),
              child: ListTile(
                leading:
                    v["vehicleImage"] != null && v["vehicleImage"].isNotEmpty
                        ? Image.asset(
                          v["vehicleImage"],
                          width: context.widthPct(20),
                          height: context.heightPct(20),
                        )
                        : const Icon(Icons.directions_car, size: 40),

                title: Text(v["vehicleName"] ?? ""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Type: ${v["vehicleType"] ?? ""}"),
                    Text("Booked By: ${v["name"] ?? ""}"),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
