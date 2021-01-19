import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class ProductController extends GetxController {
  bool addProductFlag = false;

  double checkIndex = 0;
  bool tickState=false;
  List _urlList = [
    "http://www.pngall.com/wp-content/uploads/5/Chocolate-Cake-PNG-Clipart.png",
    "https://s.clipartkey.com/mpngs/s/84-849910_los-angeles-nepal-food-momos-png.png",
    "http://www.pngall.com/wp-content/uploads/2016/05/Burger-PNG-Image.png",
    "http://www.pngall.com/wp-content/uploads/4/Fries-Transparent.png"
  ];
  onAddProductClick() {
    addProductFlag = !addProductFlag;
    update();
  }

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
      "Rs. 257",
      "Rs. 240",
      "check",
      "Actions"
    ],
    [
      "burgerImg",
      false,
      "Veg Burger",
      "Appetizer",
      "Lettuce, Cheese, Onions, Sauce",
      "Rs. 150",
      "--",
      "check",
      "Actions"
    ],
    [
      "blackForestImg",
      true,
      "Black Forest",
      "Dessert",
      "Egg, Chocolate, Whipped cream, Cherries",
      "Rs. 190",
      "Rs. 100",
      "check",
      "Actions"
    ],
    [
      "momoImg",
      true,
      "Chicken MoMo",
      "Momo",
      "Chicken",
      "Rs. 130",
      "Rs. 100",
      "check",
      "Actions"
    ],
    [
      "momoImg",
      false,
      "Veg C.MoMo",
      "Momo",
      "Cabbage",
      "Rs. 255",
      "--",
      "check",
      "Actions"
    ],
    [
      "frenchFriesImg",
      false,
      "French Fries",
      "Fries",
      "Potato",
      "Rs. 129",
      "Rs. 90",
      "check",
      "Actions"
    ],
  ];

  
  List get infoList => _infoList;

  List get infoHeadList => _infoHeadList;

  changeTickState() {
    tickState = !tickState;
    update();
  }
}
