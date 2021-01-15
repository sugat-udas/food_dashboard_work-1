import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constants.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/addProductController.dart';
import 'package:food/controller/productController.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  OutlineInputBorder borderData;
  ProductController productController = ProductController();
  @override
  Widget build(BuildContext context) {
    borderData = OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xffD9D9D9)));
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        color: Color(0xffF4F4F4),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                _saveItemBtn(),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _backBtn(),
                SizedBox(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            _itemInfoThumbnail(),
          ],
        ),
      ),
    );
  }

  _itemInfoThumbnail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _itemInfo()),
        SizedBox(
          width: 20,
        ),
        Expanded(child: _itemInfo()),
      ],
    );
  }

  Widget _itemInfo() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              "Item Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _itemInfoBody()
        ],
      ),
    );
  }

  Widget _itemInfoBody() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _itemName()),
                SizedBox(
                  width: 15,
                ),
                Expanded(child: _itemQuantity()),
              ],
            ),
            SizedBox(height: 20),
            _type(),
            SizedBox(height: 20),
            _itemDescription(),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(child: _actualPrice()),
              SizedBox(
                width: 15,
              ),
              Expanded(child: _offerPrice()),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _actualPrice() {
    return _eachItem(name: "Actual Price", hint: "Enter actual price");
  }

  Widget _offerPrice() {
    return _eachItem(name: "Offer price", hint: "Enter offer price");
  }

  Widget _type() {
    return GetBuilder(
      init: AddProductController(),
      builder: (AddProductController addProductController) => Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              "Type",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xffD9D9D9))),
            height: getDeviceType()
                ? 30
                : Get.context.isPortrait
                    ? (Get.height * .0345)
                    : (Get.height * .05),
            child: DropdownButton(
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black54,
                size: 20,
              ),
              underline: Container(
                width: 0,
              ),
              onChanged: (String newValue) {
                addProductController.setDropDown(newValue);
              },
              value: addProductController.dropdownValue,
              elevation: 16,
              items: <String>["---select---", "Veg", "Non-Veg"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ));
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemName() {
    return _eachItem(
      name: "Item Name",
      hint: "Enter item Name",
    );
  }

  Widget _eachItem({String name, String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: getDeviceType()
              ? 30
              : Get.context.isPortrait
                  ? (Get.height * .0345)
                  : (Get.height * .05),
          child: TextField(
            decoration: InputDecoration(
                focusedBorder: borderData,
                enabledBorder: borderData,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.white),
            enabled: true,
          ),
        )
      ],
    );
  }

  Widget _itemDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: getDeviceType() ? 80 : 100,
          child: TextFormField(
            maxLines: 6,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                focusedBorder: borderData,
                enabledBorder: borderData,
                contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
                hintText: "Enter item Name",
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.white),
            enabled: true,
          ),
        )
      ],
    );
  }

  Widget _itemQuantity() {
    return GetBuilder(
      init: AddProductController(),
      builder: (AddProductController addProductController) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Quantity",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xffD9D9D9))),
            height: getDeviceType()
                ? 30
                : Get.context.isPortrait
                    ? (Get.height * .0345)
                    : (Get.height * .05),
            child: DropdownButton(
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down,
                  color: Colors.black54, size: 20),
              underline: Container(
                width: 0,
              ),
              onChanged: (String newValue) {
                addProductController.setDropDown(newValue);
              },
              value: addProductController.dropdownValue,
              elevation: 16,
              items: <String>[
                "---select---",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "10"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ));
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemThumbnail() {
    return Text("Item thumbnaiisBlank");
  }

  Widget _backBtn() {
    return GetBuilder(
      init: productController,
      builder: (productController) => GestureDetector(
        onTap: () {
          print("back");
          productController.onAddProductClick();
        },
        child: Container(
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                size: 18,
                color: Colors.black87,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Back",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _saveItemBtn() {
    return GetBuilder(
      init: productController,
      builder: (productController) => Container(
        height: Constants.commonHeight,
        child: RaisedButton(
          onPressed: () {
            print("Item Added");
            productController.onAddProductClick();
          },
          elevation: 1,
          child: Text(
            "Save Item",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: "Roboto"),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: CustomColors.buttonGreenColor,
        ),
      ),
    );
  }
}
