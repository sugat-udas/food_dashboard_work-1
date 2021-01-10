import 'package:get/get.dart';

class AdminController extends GetxController {
  List get infoList => _infoList;

  List _infoHeadList = [
    "Client ID",
    "Business ID",
    "Name",
    "Contact",
    "Bonus",
    "Limit",
    "Spent",
    "Actions"
  ];

  List get infoHeadList => _infoHeadList;
  List _infoList = [
    [
      "01292",
      "0293k",
      "Kriti Gurung",
      9827271292,
      "2000",
      "Rs.2000",
      "Rs.5000",
      false,
    ],
    [
      "02292",
      "4293k",
      "Sneha Thapa",
      9827171292,
      "1000",
      "Rs.10000",
      "Rs.1000",
      false,
    ],
    [
      "01192",
      "0293k",
      "Chelsi Khetan",
      9827271242,
      "2000",
      "Rs.2000",
      "Rs.1000",
      false,
    ],
    [
      "01932",
      "0223k",
      "Bhagyshress Thapa",
      9827471292,
      "2000",
      "Rs.2000",
      "Rs.100",
      false,
    ],
    [
      "01932",
      "0223k",
      "Niruta Devkota",
      9827271192,
      "1000",
      "Rs.2000",
      "--",
      false,
    ],
  ];
}
