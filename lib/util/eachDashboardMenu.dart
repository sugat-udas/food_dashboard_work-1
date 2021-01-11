import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/homeController.dart';
import 'package:get/get.dart';

class EachDashboardMenu extends StatelessWidget {
  // HomeController homeController;
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
    return GetBuilder(
        init: HomeController(),
        builder: (HomeController homeController) => Card(
              elevation: 0,
              color: homeController.currentIndex == index
                  ? CustomColors.buttonGreenColor
                  : CustomColors.sideMenuColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 10,
              ),
              child: ListTile(
                dense: true,
                onTap: () {
                  homeController.onSelect(index);
                },
                leading: Icon(
                  icons,
                  color: homeController.currentIndex == index
                      ? Colors.white
                      : Colors.black,
                ),
                title: Transform.translate(
                  offset: Offset(-25, 0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: homeController.currentIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ));
  }
}
