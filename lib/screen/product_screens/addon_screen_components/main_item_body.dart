import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/screen/product_screens/addon_screen_components/item.dart';

class TableItem extends StatefulWidget {
  @override
  _TableItemState createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  List<Item> items;
  bool _onSelected = false;
  bool _checkValue = false;

  @override
  void initState() {
    items = Item.getItem();
    super.initState();
  }

  DataTable dataBody() {
    return DataTable(
        columns: [
          DataColumn(
            label: Text(
              'Name',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          DataColumn(
            label: Text(
              'Limit',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Price',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          DataColumn(
              label: Text(
            "Not Available",
            style: TextStyle(
              fontSize: 16,
            ),
          )),
          DataColumn(
              label: Text(
            'Action',
            style: TextStyle(
              fontSize: 16,
            ),
          ))
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
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {

                          items.remove(item);
                          setState(() {
                            
                          });
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: dataBody(),
    );
  }
}
