import 'package:vehicle_rental_app/modules/vehicle_type/vehicle_type_model.dart';
import 'package:vehicle_rental_app/modules/wheel/wheel_model.dart';
import '../specific_model/vehicle_model.dart';

final List<WheelOption> wheelOptions = [
  WheelOption(id: 2, label: "2 Wheels"),
  WheelOption(id: 4, label: "4 Wheels"),
];

final List<VehicleTypeModel> vehicleTypes = [
  VehicleTypeModel(id: 1, wheelCount: 2, name: "Bike"),
  VehicleTypeModel(id: 2, wheelCount: 2, name: "Scooter"),
  VehicleTypeModel(id: 3, wheelCount: 4, name: "Sedan"),
  VehicleTypeModel(id: 4, wheelCount: 4, name: "SUV"),
  VehicleTypeModel(id: 5, wheelCount: 4, name: "Hatchback"),
];

final List<VehicleModel> vehicleModels = [
  VehicleModel(
    id: 1,
    vehicleTypeId: 1,
    name: "Yamaha R15",
    image: "assets/sample_images/r15.jpg",
  ),
  VehicleModel(
    id: 2,
    vehicleTypeId: 1,
    name: "Royal Enfield Classic 350",
    image: "assets/sample_images/REClassic350.jpg",
  ),
  VehicleModel(
    id: 3,
    vehicleTypeId: 2,
    name: "Honda Activa 6G",
    image: "assets/sample_images/HondaActiva6G.jpg",
  ),
  VehicleModel(
    id: 4,
    vehicleTypeId: 2,
    name: "TVS Jupiter 125",
    image: "assets/sample_images/TVSJupiter125.jpg",
  ),
  VehicleModel(
    id: 5,
    vehicleTypeId: 2,
    name: "Ather 450X",
    image: "assets/sample_images/ather.png",
  ),

  // 4-Wheelers
  VehicleModel(
    id: 6,
    vehicleTypeId: 3,
    name: "Honda City",
    image: "assets/sample_images/city.png",
  ),
  VehicleModel(
    id: 7,
    vehicleTypeId: 3,
    name: "Hyundai Verna",
    image: "assets/sample_images/verna.png",
  ),
  VehicleModel(
    id: 8,
    vehicleTypeId: 4,
    name: "Mahindra XUV700",
    image: "assets/models/xuv700.png",
  ),
  VehicleModel(
    id: 9,
    vehicleTypeId: 4,
    name: "Tata Nexon",
    image: "assets/sample_images/nexon.png",
  ),
  VehicleModel(
    id: 10,
    vehicleTypeId: 5,
    name: "Maruti Swift",
    image: "assets/sample_images/swift.png",
  ),
  VehicleModel(
    id: 11,
    vehicleTypeId: 5,
    name: "Hyundai i20",
    image: "assets/sample_images/i20.png",
  ),
  VehicleModel(
    id: 12,
    vehicleTypeId: 5,
    name: "Tata Altroz",
    image: "assets/sample_images/altroz.png",
  ),
  VehicleModel(
    id: 13,
    vehicleTypeId: 1,
    name: "Yamaha MT15",
    image: "assets/sample_images/r15.jpg",
  ),
];

