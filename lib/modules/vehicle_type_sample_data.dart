import 'package:vehicle_rental_app/modules/vehicle_type/vehicle_type_model.dart';
import 'package:vehicle_rental_app/modules/wheel/wheel_model.dart';
import 'models/vehicle_model.dart';

final List<WheelOption> wheelOptions = [
  WheelOption(id: 2, label: "2 Wheels"),
  WheelOption(id: 4, label: "4 Wheels"),
];

final List<VehicleTypeModel> vehicleTypes = [
  VehicleTypeModel(id: 1, wheelCount: 2, name: "Bike", image: "assets/bike.png"),
  VehicleTypeModel(id: 2, wheelCount: 2, name: "Scooter", image: "assets/scooter.png"),
  VehicleTypeModel(id: 3, wheelCount: 4, name: "Sedan", image: "assets/sedan.png"),
  VehicleTypeModel(id: 4, wheelCount: 4, name: "SUV", image: "assets/suv.png"),
  VehicleTypeModel(id: 5, wheelCount: 4, name: "Hatchback", image: "assets/hatchback.png"),
];

final List<VehicleModel> vehicleModels = [
  VehicleModel(
    typeId: 1,
    name: "Yamaha R15",
    image: "assets/models/r15.png",
  ),
  VehicleModel(
    typeId: 1,
    name: "Royal Enfield Classic",
    image: "assets/models/classic.png",
  ),
  VehicleModel(
    typeId: 3,
    name: "Honda City",
    image: "assets/models/city.png",
  ),
];
