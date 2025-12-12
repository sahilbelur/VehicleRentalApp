import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/database/vehicle_repo.dart';


class ReservationListViewModel extends ChangeNotifier {
  final VehicleRepository repo = VehicleRepository();
  bool isLoading = false;
  List<Map<String, dynamic>> vehicles = [];

  Future<void> loadVehicles() async {
    isLoading = true;
    notifyListeners();

    vehicles = await repo.fetchSelectedVehicles();

    isLoading = false;
    notifyListeners();
  }
}
