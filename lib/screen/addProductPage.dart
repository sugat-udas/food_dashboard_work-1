import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        color: CustomColors.backgroundLightGrey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
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
            _allItemInfo(),
          ],
        ),
      ),
    );
  }

  _allItemInfo() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _itemInfo()),
            SizedBox(
              width: 20,
            ),
            Expanded(child: _itemThumbnail()),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _category()),
            SizedBox(
              width: 20,
            ),
            Expanded(child: _addOns()),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        _extra(),
      ],
    );
  }

  Widget _itemInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
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

  Widget _itemThumbnail() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              "Thumbnail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _itemThumbnailBody()
        ],
      ),
    );
  }

  Widget _itemThumbnailBody() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      height: getDeviceType() ? 370 : 390,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          _uploadImgBtn(),
          SizedBox(
            height: 60,
          ),
          _imgPreview()
        ],
      ),
    );
  }

  Widget _uploadImgBtn() {
    return GetBuilder(
      init: AddProductController(),
      builder: (AddProductController controller) => RaisedButton.icon(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 0,
          onPressed: () {
            controller.getImage();
          },
          icon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Icon(
              Icons.add_a_photo,
              size: 20,
            ),
          ),
          label: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 5),
            child: Text("Upload Image"),
          )),
    );
  }

  Widget _imgPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Image Preview",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _largeImg()),
            SizedBox(
              width: 20,
            ),
            Expanded(child: _tileImg()),
          ],
        ),
      ],
    );
  }

  Widget _largeImg() {
    return _eachBoxImg(
      label: "Large Image",
    );
  }

  Widget _tileImg() {
    return _eachBoxImg(
        circleRadiusVal: 100,
        boxShape: BoxShape.circle,
        borderType: BorderType.Circle,
        label: "Tile Display");
  }

  Widget _eachBoxImg(
      {BoxShape boxShape,
      double circleRadiusVal,
      BorderType borderType,
      String label}) {
    return GetBuilder(
      init: AddProductController(),
      builder: (AddProductController addProductController) =>
          addProductController.image == null
              ? Container(
                  decoration: BoxDecoration(
                    shape: boxShape ?? BoxShape.rectangle,
                    color: CustomColors.backgroundLightGrey,
                  ),
                  height: getDeviceType() ? 135 : 140,
                  width: getDeviceType() ? 135 : 140,
                  child: DottedBorder(
                    dashPattern: [8, 8],
                    borderType: borderType ?? BorderType.Rect,
                    child: Center(
                        child: Text(
                      label,
                    )),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(circleRadiusVal ?? 0),
                  child: Image.file(
                    addProductController.image,
                  ),
                ),
    );

    ;
  }

  Widget _itemInfoBody() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      height: getDeviceType() ? 370 : 390,
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

  Widget _category() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _categoryBody()
        ],
      ),
    );
  }

  Widget _extra() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Extra",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
          _extraBody()
        ],
      ),
    );
  }

  Widget _extraBody() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      height: 150,
    );
  }

  Widget _categoryBody() {
    return GetBuilder(
      init: AddProductController(),
      builder: (AddProductController addProductController) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(
            top: 8,
            bottom: 8,
            right: getDeviceType() ? 8 : 20,
            left: getDeviceType() ? 0 : 20),
        child: Wrap(
          direction: Axis.horizontal,
          children: addProductController.categoryList.keys.map((String key) {
            return key == "add"
                ? Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 16.0),
                    child: Icon(
                      Icons.add_circle,
                      size: 16,
                      color: Colors.grey.shade500,
                    ),
                  )
                : Container(
                    width: getDeviceType() ? 108 : 110.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: Checkbox(
                            focusColor: Colors.blue,
                            value: addProductController.categoryList[key],
                            activeColor: Colors.indigoAccent,
                            checkColor: Colors.white,
                            onChanged: (bool value) {
                              addProductController.onChangeCategoryState(
                                  newVal: value, currentKey: key);
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(key),
                        ),
                      ],
                    ),
                  );
          }).toList(),
        ),
      ),
    );
  }

  Widget _addOns() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              "AddOns",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _addOnsBody()
        ],
      ),
    );
  }

  Widget _addOnsBody() {
    return GetBuilder(
      init: AddProductController(),
      builder: (AddProductController addProductController) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(
            top: 8,
            bottom: 8,
            right: getDeviceType() ? 8 : 20,
            left: getDeviceType() ? 0 : 20),
        child: Wrap(
          direction: Axis.horizontal,
          children: addProductController.addonsList.keys.map((String key) {
            return key == "add"
                ? Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 16.0),
                    child: Icon(
                      Icons.add_circle,
                      size: 16,
                      color: Colors.grey.shade500,
                    ),
                  )
                : Container(
                    width: getDeviceType() ? 108 : 110.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: Checkbox(
                            value: addProductController.addonsList[key],
                            activeColor: Colors.pinkAccent,
                            checkColor: Colors.white,
                            onChanged: (bool value) {
                              addProductController.onChangeAddOnsState(
                                  newVal: value, currentKey: key);
                            },
                          ),
                        ),
                        Expanded(child: Text(key)),
                      ],
                    ),
                  );
          }).toList(),
        ),
      ),
    );
  }

  Widget _actualPrice() {
    return GetBuilder(
      init: AddProductController(),
      builder: (AddProductController controller) => _eachItem(
        name: "Actual Price",
        hint: "Enter actual price",
        isNum: true,
        onChange: (newVal) => controller.setActualPrice(newVal),
      ),
    );
  }

  Widget _offerPrice() {
    return GetBuilder(
      init: AddProductController(),
      builder: (AddProductController controller) => _eachItem(
        name: "Offer price",
        hint: "Enter offer price",
        isNum: true,
        onChange: (newVal) => controller.setActualPrice(newVal),
      ),
    );
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
                addProductController.setDropDownType(newValue);
              },
              value: addProductController.dropdownTypeValue,
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
    return GetBuilder(
      init: AddProductController(),
      builder: (AddProductController controller) => _eachItem(
        name: "Item Name",
        hint: "Enter item Name",
        onChange: (newVal) => controller.setName(newVal),
      ),
    );
  }

  Widget _eachItem(
      {String name,
      String hint,
      bool isNum = false,
      Function onChange(newVal)}) {
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
          child: TextFormField(
            onChanged: (String newVal) {
              onChange(newVal);
            },
            keyboardType: isNum ? TextInputType.number : TextInputType.name,
            inputFormatters: isNum
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ]
                : null,
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
          height: 100,
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
                addProductController.setDropDownQuality(newValue);
              },
              value: addProductController.dropdownQualityValue,
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
