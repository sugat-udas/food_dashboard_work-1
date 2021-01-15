import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';

class Constants {
  static BoxShadow kGeneralBoxShadow = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 3,
      offset: Offset(1, 2));

  static double commonHeight = getDeviceType()
      ? 30
      : Get.context.isPortrait
          ? (Get.height * .035)
          : (Get.height * .05);
}
