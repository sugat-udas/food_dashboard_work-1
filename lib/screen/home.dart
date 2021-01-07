import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/screen/adminDashboard.dart';
import 'package:food/util/customWidgets.dart';

class HomeScreen extends StatelessWidget {
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
    print(realOrientation.toString() + " orientation");
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
            CustomSizedBoxed(height: 15),
            _DashBoardMenus(icons: Icons.dashboard, text: "Dashboard"),
            _DashBoardMenus(icons: Icons.local_dining, text: "Orders"),
            _DashBoardMenus(icons: Icons.menu_book_rounded, text: "Menu"),
            _DashBoardMenus(icons: Icons.group_rounded, text: "Customer"),
            _DashBoardMenus(
              icons: Icons.star,
              text: "Credit",
              color: Color(0xff7FC66E),
              generalColor: Colors.white,
            ),
            _DashBoardMenus(icons: Icons.settings, text: "Settings"),
          ],
        ),
      ),
    );
  }

  Widget _DashBoardMenus(
      {IconData icons, String text, Color color, Color generalColor}) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 2,
      ),
      color: color ?? Color(0xffFAFAFA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              icons,
              color: generalColor ?? Colors.black,
              size: 16,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(color: generalColor ?? Colors.black),
            )
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
