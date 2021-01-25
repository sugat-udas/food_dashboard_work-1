import 'package:flutter/cupertino.dart';

class ProductController extends ChangeNotifier {
  bool addProductFlag = false;

  double _checkIndex = 2;
  bool tickState = false;
  List _urlList = [
    "assets/food/burger.png",
    "assets/food/cake.png",
    "assets/food/momo.png",
    "assets/food/fries.png",
  ];

  List get urlList => _urlList;
  List _infoHeadList = [
    "",
    "Type",
    "Name",
    "Category",
    "Addons",
    "Price",
    "Offer Price",
    "Not Available",
    "Actions"
  ];

  List _infoList = [
    [
      "burgerImg",
      true,
      "Chicken Burger",
      "Appetizer, Snack",
      "Lettuce, Cheese, Onions, Sauce",
      257,
      240,
      "check",
      "Actions"
    ],
    [
      "burgerImg",
      false,
      "Veg Burger",
      "Appetizer",
      "Lettuce, Cheese, Onions, Sauce",
      150,
      0,
      "check",
      "Actions"
    ],
    [
      "blackForestImg",
      true,
      "Black Forest",
      "Dessert",
      "Egg, Chocolate, Whipped cream, Cherries",
      190,
      100,
      "check",
      "Actions"
    ],
    [
      "momoImg",
      true,
      "Chicken MoMo",
      "Momo",
      "Chicken",
      130,
      100,
      "check",
      "Actions"
    ],
    [
      "momoImg",
      false,
      "Veg C.MoMo",
      "Momo",
      "Cabbage",
      255,
      0,
      "check",
      "Actions"
    ],
    [
      "frenchFriesImg",
      false,
      "French Fries",
      "Fries",
      "Potato",
      129,
      90,
      "check",
      "Actions"
    ],
  ];

  List get infoList => _infoList;

  List get infoHeadList => _infoHeadList;

  changeTickState() {
    tickState = !tickState;
    notifyListeners();
  }

  onAddProductClick() {
    addProductFlag = !addProductFlag;
    notifyListeners();
  }

  deleteProduct(index) {
    _infoList.removeAt(index);
    notifyListeners();
  }
}
