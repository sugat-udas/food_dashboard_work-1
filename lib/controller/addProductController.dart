import 'package:get/get.dart';

class AddProductController extends GetxController {
  String dropdownValue = "---select---";

  setDropDown(val) {
    dropdownValue = val;
    update();
  }
}
