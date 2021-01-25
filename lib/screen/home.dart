import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/util/commonMethods.dart';
import 'package:food/controller/homeController.dart';
import 'package:food/util/eachDashboardMenu.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  var _homeControllerState;

  String url =
      "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/122777514_4658406440867560_8980358279672578081_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=K7SoRreE8DAAX_sx1qg&_nc_ht=scontent.fktm3-1.fna&oh=f00647a1eaff1045999abed17c74f31a&oe=60286AD1";

  var realOrientation;
  double height;
  double width;

  bool isMenuFixed(BuildContext context) {
    return MediaQuery.of(context).size.width > 500;
  }

  @override
  Widget build(BuildContext context) {
    _homeControllerState = Provider.of<HomeController>(context);

    realOrientation = MediaQuery.of(context).orientation;
    height = Get.height;
    width = Get.width;
    // print(realOrientation.toString() + " realOrientation");

    if (getDeviceType()) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    return Scaffold(
      drawer: (getDeviceType() ||
              (getDeviceType() == false &&
                  _homeControllerState.getOpacityForOrientation(context) == 1))
          ? _menuSideBar(context)
          : null,
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  Widget _body(context) {
    // print(realOrientation.toString() + " orientations");
    return Consumer<HomeController>(builder: (context, homeController, child) {
      return Row(
        children: [
          (getDeviceType() == false &&
                  _homeControllerState.getOpacityForOrientation(context) == 0)
              ? _menuSideBar(context)
              : SizedBox(),
          _homeControllerState.screensList[homeController
              .currentIndex], //Using global variable to use the context from the staleless widgets
        ],
      );
    });
  }

  double _menuSidebarSizeMaintain(context) {
    double value;
    if (getDeviceType()) {
      value = 180;
    } else if (!getDeviceType() &&
        _homeControllerState.getOpacityForOrientation(context) == 0) {
      value = width * 0.17;
    } else if (!getDeviceType() &&
        _homeControllerState.getOpacityForOrientation(context) == 1) {
      value = width * 0.22;
      // print("yess it is potrait and tablet");
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
              (getDeviceType() ||
                      _homeControllerState.getOpacityForOrientation(context) ==
                          1)
                  ? SizedBox(
                      height: 75,
                      child: DrawerHeader(
                        child: Text(
                          "Menu",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        margin: EdgeInsets.zero,
                      ),
                    )
                  : SizedBox(height: 5),
              SizedBox(
                height: 10,
              ),
              EachDashboardMenuItem(
                icons: Icons.dashboard,
                text: "Dashboard",
                index: 0,
              ),
              EachDashboardMenuItem(
                icons: Icons.local_dining,
                text: "Orders",
                index: 1,
              ),
              EachDashboardMenuItem(
                icons: Icons.menu_book_rounded,
                text: "Product",
                index: 2,
              ),
              EachDashboardMenuItem(
                icons: Icons.group_rounded,
                text: "Customers",
                index: 3,
              ),
              EachDashboardMenuItem(
                icons: Icons.star,
                text: "Credit",
                index: 4,
              ),
              EachDashboardMenuItem(
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
