import 'package:flutter/material.dart';

class QuantityController extends ChangeNotifier {
  List quantityInfoList = [
    "Per plate ",
    "A bowl",
    "10 pieces",
  ];

  bool addQualtityFlag = false;

  List infoHeadList = [
    "Total Quantity",
    "Actions",
  ];
  List get getInfoHeadList => infoHeadList;

  set setInfoHeadList(List infoHeadList) => this.infoHeadList = infoHeadList;
  List get getQuantityInfoList => quantityInfoList;

  set setQuantityInfoList(List quantityInfoList) =>
      this.quantityInfoList = quantityInfoList;

  deleteProduct(int index) {
    quantityInfoList.removeAt(index);
    notifyListeners();
  }

  onAddQuantityClick() {
    addQualtityFlag = !addQualtityFlag;
    notifyListeners();
  }
}
