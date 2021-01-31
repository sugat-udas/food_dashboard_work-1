import 'package:flutter/material.dart';

class TypeController extends ChangeNotifier {
  List infoList = [
    [
      "Veg",
      "assets/veg&nonVeg/Veg.png",
      "Actions",
    ],
    [
      "Non-veg",
      "assets/veg&nonVeg/nonVeg.png",
      "Actions",
    ],
  ];

  List infoHeadList = [
    "Name",
    "Icon",
    "Actions",
  ];

  deleteEntries(int index) {
    infoList.removeAt(index);
    notifyListeners();
  }
}
