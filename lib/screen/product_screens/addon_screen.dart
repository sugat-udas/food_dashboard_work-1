import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/util/commonMethods.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:food/controller/productScreenControllers/addoOnScreenControllers.dart';

import 'add_item_screen.dart';


//ignore: must_be_immutable
class AddonScreen extends StatelessWidget {
  AddOnScreenController _addOnScreenController;
  double commonHeight;


  BoxShadow boxShad=BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 4,
    offset: Offset(2,2)
  );


  @override
  Widget build(BuildContext context) {
    _addOnScreenController = Provider.of<AddOnScreenController>(context);
    commonHeight = getDeviceType()
        ? 30
        : Get.context.isPortrait
        ? (Get.height * .035)
        : (Get.height * .05);
    return _body();
  }

  Widget _body(){
    return Expanded(child: _addOnScreenController.addOnScreenFlag
    ?AddItemScreen()
    :Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 25,
      ),
      color: Color(0xffF4F4F4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchBarItems(),
          SizedBox(height:20 ,),
          Container(
            child: Expanded(
              child: SingleChildScrollView(
                child: _itemDatatable(),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _itemDatatable(){
    return Container(
      width: 800,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [boxShad]
      ),
      child: SingleChildScrollView(
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(122),
            1: FlexColumnWidth(106),
            2: FlexColumnWidth(162),
            3: FlexColumnWidth(137),
            4: FlexColumnWidth(154),
            5: FlexColumnWidth(95),
          },
          border: TableBorder(
            horizontalInside: BorderSide(
              width: 0.5, color: CustomColors.borderLightGreyLineBg,
            ),
          ),
          children: [
            TableRow(
              children: [
                for (var head in _addOnScreenController.itemHeadList)
                  TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 12.5,
                          left: 20.0,
                          right: 20,
                        ),
                        child: Text(
                          head.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ))
              ],
            ),
            for (var item in _addOnScreenController.itemInfoList)
            TableRow(
              children: [
                 TableCell(
                   verticalAlignment: TableCellVerticalAlignment.middle,
                     child: _infoName(
                       text: item[0],
                     )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: _infoName(
                        text: item[1]
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: _infoName(
                        text: item[2]
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: _infoName(
                        text: item[3]
                    )),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      _productNotAvail()
                    ],
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      actionButtons(onPressDelete: () {
                        _addOnScreenController.deleteItem(
                            _addOnScreenController.itemInfoList.indexOf(item));
                      }),
                    ],
                  ),
                )


              ],
            ),


          ],
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
                EntriesShowBtn(),
                SizedBox(
                  width: 5,
                ),
                AddEntriesBtn(),
              ],
            ),
          ),
          addnewBtn(
            onPress: () {
              _addOnScreenController.onAddItemClick();
            },
          ),
        ],
      ),
    );
  }
  Widget _infoName({String text}) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.5,
        bottom: 19.5,
        left: 29.0
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            // fontFamily:
            //     "Roboto",
            fontSize: 14.0
          ),
        ),
      ),
    );
  }

  Widget _productNotAvail() {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.grey.shade400),
      child: Checkbox(
        tristate: false,
        value: _addOnScreenController.tickState,
        onChanged: (value) {
          _addOnScreenController.changeTickState();
        },
      ),
    );
  }
}
