import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TypeController extends ChangeNotifier {
  File image;
   final picker = ImagePicker();
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

  bool addTypeFlag = false;
  onAddTypeClick() {
    addTypeFlag = !addTypeFlag;
    notifyListeners();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    } else {
      print("Images");
    }
  }

  String _typeName;
 String get typeName => _typeName;

 set typeName(String value) => _typeName = value;
setName(String val) {
    typeName = val;
    notifyListeners();
    print(typeName);
  }
}
