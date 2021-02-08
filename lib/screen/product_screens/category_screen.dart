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
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
        child: CategoryScreenBody(),
      ),
          ),
    );
  }
}
