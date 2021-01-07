import 'package:flutter/material.dart';

Widget CustomFixedDivider() {
  return Divider(
    height: 15,
    color: Color(0xffE8E8E8),
  );
}

Text CustomBoldText({String text}) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
  );
}

Widget CustomSizedBoxed({double height, double width}) {
  return SizedBox(height: height, width: width);
}
