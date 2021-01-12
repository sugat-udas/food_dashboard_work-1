import 'package:flutter/material.dart';

Widget customFixedDivider() {
  return Divider(
    height: 15,
    color: Colors.grey.shade300,
  );
}

Text customBoldText({String text}) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
  );
}

Widget customSizedBoxed({double height, double width}) {
  return SizedBox(height: height, width: width);
}

bool getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  print(data.size.shortestSide < 600 ? 'phone' : 'tablet');
  return data.size.shortestSide < 600 ? true : false;
}

Widget actionButtons() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: (Row(
      children: [
        Icon(
          Icons.edit,
          color: Colors.blue,
          size: 20,
        ),
        customSizedBoxed(
          width: 10,
        ),
        Icon(
          Icons.delete,
          color: Colors.red,
          size: 20,
        ),
      ],
    )),
  );
}
