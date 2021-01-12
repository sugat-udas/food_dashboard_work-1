import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/adminController.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  double _commonHeight;

  @override
  Widget build(BuildContext context) {
    _commonHeight = getDeviceType()
        ? 30
        : context.isPortrait
            ? (Get.height * .035)
            : (Get.height * .05);
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        color: Color(0xffF4F4F4),
        child: Column(
          children: [
            _searchBarItems(),
            _foodDataTable(),
          ],
        ),
      ),
    );
  }

  Widget _foodDataTable() {
    return GetBuilder(
      init: AdminController(),
      builder: (AdminController adminController) => Container(
        //elevation: 1,

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [Constants.kGeneralBoxShadow]),

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(1.4),
              1: FlexColumnWidth(1.8),
              2: FlexColumnWidth(2.6),
              3: FlexColumnWidth(1.9),
              4: FlexColumnWidth(1.3),
              5: FlexColumnWidth(1.5),
              6: FlexColumnWidth(1.3),
              7: FlexColumnWidth(1.2),
            },
            border: TableBorder(
              horizontalInside: BorderSide(
                  width: 0.5, color: CustomColors.borderDividerColor),
              // bottom: BorderSide(width: 1, color: Colors.red)
            ),
            children: [
              TableRow(children: [
                for (var head in adminController.infoHeadList)
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      top: 7.0,
                      bottom: 13.0,
                    ),
                    child: Text(
                      head.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ))
              ]),
              for (List eachList in adminController.infoList)
                TableRow(children: [
                  for (var each in eachList)
                    TableCell(
                      child: each == false
                          ? actionButtons()
                          : Padding(
                              padding: EdgeInsets.only(
                                top: 17.0,
                                bottom: 7.0,
                              ),
                              child: Text(
                                each.toString(),
                              ),
                            ),
                    ),
                ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBarItems() {
    return Container(
      child: Row(
        children: [
          Expanded(flex: 4, child: SearchBar()),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Container(
                  height: _commonHeight,
                  child: RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    icon: Icon(
                      Icons.menu,
                      size: 18,
                    ),
                    label: Text("Showing 6 entries"),
                    onPressed: () {},
                    color: Color(0xffDBDBDB),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: _commonHeight,
                  height: _commonHeight,
                  child: Card(
                    child: Icon(
                      Icons.add,
                      size: 20,
                    ),
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Color(0xffDBDBDB),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: _commonHeight,
            child: RaisedButton(
              elevation: 1,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 14,
                    color: Colors.white,
                  ),
                  Text(
                    "Add New",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: CustomColors.buttonGreenColor,
            ),
          ),
        ],
      ),
    );
  }
}
