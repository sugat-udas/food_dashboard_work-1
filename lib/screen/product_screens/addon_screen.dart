import 'package:food/responsive.dart';
import 'package:food/screen/product_screens/addon_screen_components/addons_table_item.dart';
import 'package:get/get.dart';

import '../../util/customWidgets.dart';
import '../../util/searchBarItems.dart';
import 'package:flutter/material.dart';

class AddonScreen extends StatefulWidget {
  @override
  _AddonScreenState createState() => _AddonScreenState();
}

class _AddonScreenState extends State<AddonScreen> {
  BoxShadow boxShad = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(2, 2));

  Widget dataBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          boxShad,
        ],
      ),
      child: AddonsTableItem(),
    );
  }


 Widget _searchBarItems() {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: 400.0,
              child: SearchBar(),
            ),
          ),
          SizedBox(
            width: Responsive.isMobile(Get.context) ||
                    Responsive.isTablet(Get.context)
                ? 15
                : 30,
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  EntriesShowBtn(
              // entries: _quantityControllerState.getQuantityInfoList.length,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  AddEntriesBtn(),
                ],
              ),
            ),
          ),
          Container(
            child: addnewBtn(
              onPress: () {
                // _quantityControllerState.onAddQuantityClick();
              },
            ),
          ),
        ],
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        color: Color(0xffF4F4F4),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _searchBarItems(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: dataBody(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
