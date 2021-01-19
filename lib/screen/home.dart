import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/creditController.dart';
import 'package:food/controller/homeController.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/eachDashboardMenu.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  String url =
      "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/122777514_4658406440867560_8980358279672578081_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=K7SoRreE8DAAX_sx1qg&_nc_ht=scontent.fktm3-1.fna&oh=f00647a1eaff1045999abed17c74f31a&oe=60286AD1";

  HomeController controller;
  CreditController adminController;
  var realOrientation;
  double height;
  double width;

  bool isMenuFixed(BuildContext context) {
    return MediaQuery.of(context).size.width > 500;
  }

  bool getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    print(data.size.shortestSide < 600 ? 'phone' : 'tablet');
    return data.size.shortestSide < 600 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    realOrientation = MediaQuery.of(context).orientation;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print(realOrientation.toString() + " realOrientation");

    if (getDeviceType()) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    return Scaffold(
      drawer: (getDeviceType() ||
              (getDeviceType() == false &&
                  getOpacityForOrientation(context) == 1))
          ? _menuSideBar(context)
          : null,
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  int getOpacityForOrientation(context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return 0;
    } else {
      return 1;
    }
  }

  Widget _body(context) {
    print(realOrientation.toString() + " orientations");
    return Consumer<HomeController>(builder: (context, homeController, child) {
      return Row(
        children: [
          (getDeviceType() == false && getOpacityForOrientation(context) == 0)
              ? _menuSideBar(context)
              : SizedBox(),
          homeController
              .screensList[homeController.currentIndex],
        ],
      );
    });
  }

  double _menuSidebarSizeMaintain(context) {
    double value;
    if (getDeviceType() ||
        (!getDeviceType() && getOpacityForOrientation(context) == 1)) {
      value = 180;
    } else if (!getDeviceType() && getOpacityForOrientation(context) == 0) {
      value = width * 0.17;
    }

    return value;
  }

  Widget _menuSideBar(context) {
    return Container(
      width: _menuSidebarSizeMaintain(context),
      child: Drawer(
        elevation: 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
           (getDeviceType() || getOpacityForOrientation(context) == 1)?   SizedBox(height: 75, child: DrawerHeader(child: Text("Menu",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),margin: EdgeInsets.zero,)):SizedBox(height:15),
             SizedBox(height: 10,),
              EachDashboardMenu(
                icons: Icons.dashboard,
                text: "Dashboard",
                index: 0,
              ),
              EachDashboardMenu(
                icons: Icons.local_dining,
                text: "Orders",
                index: 1,
              ),
              EachDashboardMenu(
                icons: Icons.menu_book_rounded,
                text: "Product",
                index: 2,
              ),
              EachDashboardMenu(
                icons: Icons.group_rounded,
                text: "Customers",
                index: 3,
              ),
              EachDashboardMenu(
                icons: Icons.star,
                text: "Credit",
                index: 4,
              ),
              EachDashboardMenu(
                  icons: Icons.settings, text: "Settings", index: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.green),
      title: Text(
        "FOODIZM",
        style: TextStyle(
          color: CustomColors.buttonGreenColor,
        ),
      ),
      actions: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                url,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Niraj Karanjeet",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade600,
              size: 22,
            ),
            SizedBox(
              width: 30,
            ),
          ],
        )
      ],
      backgroundColor: Colors.white,
    );
  }
}
