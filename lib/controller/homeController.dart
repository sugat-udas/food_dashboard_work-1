import 'package:food/screen/credit_screen.dart';
import 'package:food/screen/customer_screen.dart';
import 'package:food/screen/dashboard_screen.dart';
import 'package:food/screen/order_screen.dart';
import 'package:food/screen/product_screen.dart';
import 'package:food/screen/setting_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int _currentIndex = 2;

  int get currentIndex => _currentIndex;
  List _screens = [
    DashboardScreen(),
    OrderScreen(),
    ProductScreen(),
    CustomerScreen(),
    AdminDashBoard(),
    SettingScreen(),
  ];

  List get screensList => _screens;

  set currentIndex(int value) {
    _currentIndex = value;
  }

  void onSelect(int index) {
    currentIndex = index;
    update();
  }
}
