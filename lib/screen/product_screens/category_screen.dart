import 'package:flutter/material.dart';
import 'package:food/screen/product_screens/category_screen_body.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
           height: Get.height-MediaQuery.of(context).padding.top-kToolbarHeight,
          child: CategoryScreenBody(),
        ),
      ),
    );
  }
}
