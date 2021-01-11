import 'package:food/screen/adminDashboard.dart';
import 'package:food/screen/customer_screen.dart';
import 'package:food/screen/dashboard_screen.dart';
import 'package:food/screen/food_item_screen.dart';
import 'package:food/screen/order_screen.dart';
import 'package:food/screen/setting_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int _currentIndex = 0;
  List _screens = [
    DashboardScreen(),
    OrderScreen(),
    FoodItemsPage(),
    CustomerScreen(),
    AdminDashBoard(),
    SettingScreen(),
  ];

  List get screensList => _screens;

  set currentIndex(int value) {
    _currentIndex = value;
  }

  int get currentIndex => _currentIndex;

  void onSelect(int index) {
    currentIndex = index;
    update();
  }
}
