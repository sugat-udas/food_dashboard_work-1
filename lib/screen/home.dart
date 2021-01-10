import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/controller/adminController.dart';
import 'package:food/screen/adminDashboard.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/eachDashboardMenu.dart';

class HomeScreen extends StatelessWidget {
  AdminController adminController;
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
          ? _MenuSideBar(context)
          : null,
      appBar: _AppBar(),
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
    return Row(
      children: [
        (getDeviceType() == false && getOpacityForOrientation(context) == 0)
            ? _MenuSideBar(context)
            : SizedBox(),
        AdminDashBoard(),
      ],
    );
  }

  double _MenuSidebarSizeMaintain(context) {
    if (getDeviceType() ||
        (!getDeviceType() && getOpacityForOrientation(context) == 1)) {
      return 180;
    } else if (!getDeviceType() && getOpacityForOrientation(context) == 0) {
      return width * 0.17;
    }
  }

  Widget _MenuSideBar(context) {
    return Container(
      color: Colors.green,
      width: _MenuSidebarSizeMaintain(context),
      child: Drawer(
        elevation: 0,
        child: ListView(
          children: [
            customSizedBoxed(height: 15),
            EachDashboardMenu(icons: Icons.dashboard, text: "Dashboard"),
            EachDashboardMenu(icons: Icons.local_dining, text: "Orders"),
            EachDashboardMenu(icons: Icons.menu_book_rounded, text: "Product"),
            EachDashboardMenu(icons: Icons.group_rounded, text: "Customer"),
            EachDashboardMenu(
              icons: Icons.star,
              text: "Credit",
              color: Color(0xff7FC66E),
              generalColor: Colors.white,
            ),
            EachDashboardMenu(icons: Icons.settings, text: "Settings"),
          ],
        ),
      ),
    );
  }

  Widget _AppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.green),
      title: Text(
        "FOODIZM",
        style: TextStyle(
          color: Color(0xff7FC66E),
        ),
      ),
      actions: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/122777514_4658406440867560_8980358279672578081_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=0gu5vxX82-oAX-gc96F&_nc_ht=scontent.fktm3-1.fna&oh=35af3a76207cc2e56368dbde03f20eee&oe=6000DDD1"),
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
