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

Widget actionButtons({Function onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: (Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.edit,
          color: Colors.blue,
          size: 20,
        ),
        customSizedBoxed(
          width: 10,
        ),
        GestureDetector(
          onTap: onPressed,
          child: Icon(
            Icons.delete,
            color: Colors.red,
            size: 20,
          ),
        ),
      ],
    )),
  );
}
