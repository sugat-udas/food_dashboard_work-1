import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/homeController.dart';
import 'package:provider/provider.dart';

class EachDashboardMenu extends StatelessWidget {
    var _commomControllerState;
var _homeControllerState;
  final IconData icons;
  final String text;
  final int index;

  EachDashboardMenu({
    this.icons,
    this.text,
    this.index,
  });
  @override
  Widget build(BuildContext context) {
    _homeControllerState=Provider.of<HomeController>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<HomeController>(context,listen: false).onSelect(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: _homeControllerState.currentIndex == index
                ? CustomColors.buttonGreenColor
                : CustomColors.sideMenuColor,
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        child: Row(
          children: [
            Icon(
              icons,
              size: 20,
              color: _homeControllerState.currentIndex == index
                  ? Colors.white
                  : Colors.black,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color:
                    _homeControllerState.currentIndex == index
                        ? Colors.white
                        : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
