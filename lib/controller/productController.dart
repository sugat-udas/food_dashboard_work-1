import 'package:flutter/cupertino.dart';

class ProductController extends ChangeNotifier {
  bool addProductFlag = false;

  double _checkIndex = 2;
  bool tickState = false;
  List _urlList = [
    "http://www.pngall.com/wp-content/uploads/5/Chocolate-Cake-PNG-Clipart.png",
    "https://s.clipartkey.com/mpngs/s/84-849910_los-angeles-nepal-food-momos-png.png",
    "http://www.pngall.com/wp-content/uploads/2016/05/Burger-PNG-Image.png",
    "http://www.pngall.com/wp-content/uploads/4/Fries-Transparent.png"
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
