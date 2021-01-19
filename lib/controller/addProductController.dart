import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  File image;
String name;
String actualPrice;
String offeredPrice;


  final picker = ImagePicker();

setName(String val){
  name=val;
  update();
  print(name);
}
setActualPrice(String val){
  actualPrice=val;
  update();
  print(actualPrice);
}
setOfferedPrice(String val){
  offeredPrice=val;
  update();
  print(offeredPrice);
}

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    } else {
      print("Images");
    }
  }

  Map<String, bool> categoryList = {
    'Snack': false,
    'Dessert': false,
    'Mo:Mo': false,
    'Spicy': false,
    'Appetizer': false,
    'Chilly': false,
    'Sweet': false,
    'Salad': false,
    'breakfast': false,
    'dinner': false,
    'Salty': false,
    'add': false,
  };
  Map<String, bool> addonsList = {
    'Bread': false,
    'Mo:Mo': false,
    'Sauce': false,
    'Chilly': false,
    'Onion': false,
    'Chips': false,
    'Cake': false,
    'Breed': false,
    'Sugar': false,
    'Colcolate': false,
    'Potato': false,
    'add': false,
  };

  var _tmpArray = [];

  onChangeCategoryState({bool newVal, String currentKey}) {
    categoryList[currentKey] = newVal;
    update();
  }

  String dropdownQualityValue = "---select---";
  String dropdownTypeValue = "---select---";
  bool uploadedImg = false;

  setDropDownQuality(val) {
    dropdownQualityValue = val;
    update();
  }

  setDropDownType(val) {
    dropdownTypeValue = val;
    update();
  }
}
