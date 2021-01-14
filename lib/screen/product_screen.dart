import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/productController.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        color: Color(0xffF4F4F4),
        child: Column(
          children: [
            _searchBarItems(),
            SizedBox(
              height: 20,
            ),
            Expanded(child: SingleChildScrollView(child: _foodDataTable())),
          ],
        ),
      ),
    );
  }

  Widget _foodDataTable() {
    return GetBuilder(
      init: ProductController(),
      builder: (ProductController productController) => Container(
        //elevation: 1,

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [Constants.kGeneralBoxShadow]),

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(1.0),
              1: FlexColumnWidth(1.2),
              2: FlexColumnWidth(2.3),
              3: FlexColumnWidth(1.7),
              4: FlexColumnWidth(2.5),
              5: FlexColumnWidth(1.5),
              6: FlexColumnWidth(1.7),
              7: FlexColumnWidth(2),
            },
            border: TableBorder(
              horizontalInside: BorderSide(
                  width: 0.5, color: CustomColors.borderDividerColor),
              // bottom: BorderSide(width: 1, color: Colors.red)
            ),
            children: [
              TableRow(children: [
                for (var head in productController.infoHeadList)
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
              for (List eachList in productController.infoList)
                TableRow(children: [
                  for (var each in eachList)
                    TableCell(
                      child: each == "frenchFriesImg"
                          ? _foodImage(
                              url: productController.urlList[3],
                              bottomPadding: 5.0)
                          : each == "burgerImg"
                              ? _foodImage(url: productController.urlList[2])
                              : each == "momoImg"
                                  ? _foodImage(
                                      url: productController.urlList[1],
                                      shape: BoxShape.circle,
                                      height: 34)
                                  : each == "blackForestImg"
                                      ? _foodImage(
                                          url: productController.urlList[0],
                                          height: 30)
                                      : each == false
                                          ? _foodType(each)
                                          : each == true
                                              ? _foodType(each)
                                              : each == "Actions"
                                                  ? actionButtons()
                                                  : each == "check"
                                                      ? Theme(
                                                          data: ThemeData(
                                                              unselectedWidgetColor:
                                                                  Colors.grey
                                                                      .shade400),
                                                          child: Checkbox(
                                                            tristate: false,
                                                            value: false,
                                                            onChanged: (value) {
                                                              productController
                                                                  .changeTickState();
                                                            },
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 15.0,
                                                            bottom: 15.0,
                                                          ),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              each.toString(),
                                                              style:
                                                                  TextStyle(),
                                                            ),
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

  Widget _foodImage(
      {String url, BoxShape shape, double height, double bottomPadding}) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: bottomPadding ?? 16, right: 15),
      height: height ?? 25,
      width: 40,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(
            url,
          ),
        ),
      ),
    );
  }

  Widget _foodType(bool val) {
    return val
        ? _eachFoodType("assets/nonVeg.png")
        : _eachFoodType("assets/Veg.png");
  }

  Widget _eachFoodType(String assets) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 25),
      color: Colors.white,
      child: Image.asset(
        assets,
        fit: BoxFit.contain,
        width: 12,
        height: 12,
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
                    elevation: 0,
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
                    elevation: 0,
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