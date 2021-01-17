import 'package:get/get.dart';

class AddProductController extends GetxController {
  String dropdownValue = "---select---";
  bool uploadedImg = false;

  setDropDown(val) {
    dropdownValue = val;
    update();
  }
}
