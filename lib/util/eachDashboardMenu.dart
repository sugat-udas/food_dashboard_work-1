import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/homeController.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
    return GestureDetector(
      onTap: () {
        Provider.of<HomeController>(context,listen: false).onSelect(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Provider.of<HomeController>(context).currentIndex == index
                ? CustomColors.buttonGreenColor
                : CustomColors.sideMenuColor,
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        child: Row(
          children: [
            Icon(
              icons,
              size: 20,
              color: Provider.of<HomeController>(context).currentIndex == index
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
                    Provider.of<HomeController>(context).currentIndex == index
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
