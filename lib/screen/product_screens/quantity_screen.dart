import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/productScreenControllers/quantityScreenController.dart';
import 'package:food/screen/product_screens/add_quantity_screen.dart';
import 'package:food/util/commonMethods.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class QuantityScreen extends StatelessWidget {
  QuantityController _quantityControllerState;
  // AddProductController _addProductControllerState;

  double commonHeight;

  BoxShadow boxShad = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(2, 2));

  @override
  Widget build(BuildContext context) {
    _quantityControllerState = Provider.of<QuantityController>(context);
    // _addProductControllerState = Provider.of<AddProductController>(context);
    commonHeight = getDeviceType()
        ? 30
        : Get.context.isPortrait
            ? (Get.height * .035)
            : (Get.height * .05);

    return _body();
  }

  Widget _body() {
    return Expanded(
      child:
          _quantityControllerState.addQualtityFlag
          ? AddQuantityScreen():
          Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 25,
        ),
        color: Color(0xffF4F4F4),
        child: Column(
          children: [
            _searchBarItems(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: _foodDataTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _foodDataTable() {
    return Container(
      //elevation: 1,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          boxShad,
        ],
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20,
        ),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(4.0),
            1: FlexColumnWidth(1.8),
          },
          border: TableBorder(
            horizontalInside:
                BorderSide(width: 0.5, color: CustomColors.borderDividerColor),
          ),
          children: [
            TableRow(
              children: [
                for (var head in _quantityControllerState.infoHeadList)
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.only(
                      top: 13,
                      bottom: 13,
                    ),
                    child: Text(
                      head.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ))
              ],
            ),
            for (var each in _quantityControllerState.quantityInfoList)
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _QuantityName(text: each),
                    )),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: actionButtons(onPressed: () {
                    _quantityControllerState.deleteProduct(
                        _quantityControllerState.quantityInfoList
                            .indexOf(each));
                  }),
                )
              ]),
          ],
        ),
      ),
    );
  }

  Widget _QuantityName({String text}) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              // fontFamily:
              //     "Roboto",
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
                _entriesShowBtn(),
                SizedBox(
                  width: 5,
                ),
                _addEntriesBtn(),
              ],
            ),
          ),
          _addQualityBtn(),
        ],
      ),
    );
  }

  Widget _addEntriesBtn() {
    return Container(
      width: commonHeight,
      height: commonHeight,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xffDBDBDB),
      ),
      child: IconButton(
        onPressed: () {},
        enableFeedback: true,
        icon: Icon(
          Icons.add,
          size: 20,
        ),
      ),
    );
  }

  Widget _entriesShowBtn() {
    return Container(
      height: commonHeight,
      child: RaisedButton.icon(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        icon: Icon(
          Icons.menu,
          size: 18,
        ),
        label: Text("Showing 6 entries"),
        onPressed: () {},
        color: Color(0xffDBDBDB),
      ),
    );
  }

Widget  _addQualityBtn() {
    return Container(
      height: commonHeight,
      child: RaisedButton(
        elevation: 1,
        onPressed: () {
          _quantityControllerState.onAddQuantityClick();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 14,
              color: Colors.white,
            ),
            Text(
              " Add New",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: CustomColors.buttonGreenColor,
      ),
    );
  }
}
