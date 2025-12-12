import 'package:flutter/material.dart';

class BookingViewModel extends ChangeNotifier {
  String? fname;
  String? lname;
  String? vehicleName;
  String? vehicleType;
  String? vehicleImage;

  void setPersonalDetails(String f, String l) {
    fname = f;
    lname = l;
    notifyListeners();

    print("VM updated → fname: $fname, lname: $lname");
  }

  void setVehicleDetails({String? vName, String? vType, String? vImage}) {
    if (vName != null) {
      vehicleName = vName;
    }
    if (vType != null) {
      vehicleType = vType;
    }
    if (vImage != null) {
      vehicleImage = vImage;
    }
    notifyListeners();

    print("VM updated → vName: $vehicleName, vType: $vehicleType, vImage: $vehicleImage");
  }

}
