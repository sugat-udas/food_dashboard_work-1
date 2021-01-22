import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends ChangeNotifier {
  File image;
  String name;
  String actualPrice;
  String offeredPrice;

  final picker = ImagePicker();
  setName(String val) {
    name = val;
    notifyListeners();
    print(name);
  }

  setActualPrice(String val) {
    actualPrice = val;
    notifyListeners();
    print(actualPrice);
  }

  setOfferedPrice(String val) {
    offeredPrice = val;
    notifyListeners();
    print(offeredPrice);
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
    'Chocolate': false,
    'Potato': false,
    'add': false,
  };

  var _tmpArray = [];

  onChangeCategoryState({bool newVal, String currentKey}) {
    categoryList[currentKey] = newVal;
    notifyListeners();
  }

  onChangeAddOnsState({bool newVal, String currentKey}) {
    addonsList[currentKey] = newVal;
    notifyListeners();
  }

  String dropdownQualityValue = "---select---";
  String dropdownTypeValue = "---select---";

  setDropDownQuality(val) {
    dropdownQualityValue = val;
    notifyListeners();
    print(dropdownQualityValue.toString());
  }

  setDropDownType(val) {
    dropdownTypeValue = val;
    notifyListeners();
    print(dropdownQualityValue);
  }
}
