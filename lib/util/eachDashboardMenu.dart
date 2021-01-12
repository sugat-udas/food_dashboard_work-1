import 'package:flutter/cupertino.dart';
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
        builder: (HomeController homeController) => GestureDetector(
              onTap: () {
                homeController.onSelect(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: homeController.currentIndex == index
                        ? CustomColors.buttonGreenColor
                        : CustomColors.sideMenuColor,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Row(
                  children: [
                    Icon(
                      icons,
                      size: 20,
                      color: homeController.currentIndex == index
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
                        color: homeController.currentIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
