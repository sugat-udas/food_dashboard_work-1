import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/customFonts.dart';
import 'package:food/screen/product_screens/addon_screen_components/item.dart';

class AddonsTableItem extends StatefulWidget {
  @override
  _AddonsTableItemState createState() => _AddonsTableItemState();
}

class _AddonsTableItemState extends State<AddonsTableItem> {
  List<Item> items;
  bool _onSelected = false;
  bool _checkValue = false;
  List<String> infoHeader = [
    "Name",
    "Limit",
    "Description",
    "Price",
    "Not Available",
    "Action",
  ];

  @override
  void initState() {
    items = Item.getItem();
    super.initState();
  }

  DataTable dataBody() {
    return DataTable(
        columnSpacing: 30,
        columns: [
          for (String each in infoHeader)
            DataColumn(
              label: Text(
                each,
                style: TextStyle(
                  fontSize: xHeaderFont,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
        rows: items.map(
          (item) {
            return DataRow(
              cells: [
                DataCell(
                  Text(item.name),
                ),
                DataCell(
                  Text(item.limit.toString()),
                ),
                DataCell(
                  Text(item.description),
                ),
                DataCell(
                  Text(item.price),
                ),
                DataCell(
                  Center(
                    child: Checkbox(
                      onChanged: (value) {
                        _checkValue = value;
                        setState(() {});
                      },
                      value: _checkValue,
                    ),
                  ),
                ),
                DataCell(
                  Row(
                    children: [
                      Icon(
                        Icons.assignment,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          items.remove(item);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: 8.0,
          top: 8.0,
          left: 15,
          right: 15,
        ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: dataBody(),
    );
  }
}
