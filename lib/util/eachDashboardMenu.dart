import 'package:flutter/material.dart';

class EachDashboardMenu extends StatelessWidget {
  final IconData icons;
  final String text;
  final Color color;
  final Color generalColor;
  EachDashboardMenu({this.icons, this.text, this.color, this.generalColor});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 2,
      ),
      color: color ?? Color(0xffFAFAFA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              icons,
              color: generalColor ?? Colors.black,
              size: 16,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(color: generalColor ?? Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
