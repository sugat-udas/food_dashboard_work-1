import 'package:flutter/material.dart';
import '../../util/customWidgets.dart';
import '../../util/searchBarItems.dart';
import 'category_data.dart';

class CategoryScreenBody extends StatefulWidget {
  @override
  _CategoryScreenBodyState createState() => _CategoryScreenBodyState();
}

class _CategoryScreenBodyState extends State<CategoryScreenBody> {
  BoxShadow boxShad = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(2, 2));
  String valueChoose;
  List listItem = ['Categories', 'Addon Items', 'Quantity', 'Type'];
  List<Data> datas;
  @override
  void initState() {
    datas = Data.getData();
    super.initState();
  }

  Widget dataBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          boxShad,
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 8.0,
          top: 8.0,
          left: 20,
          right: 20,
        ),
        child: DataTable(
          columns: [
            DataColumn(
              label: Text(
                "Name",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              numeric: false,
            ),
            DataColumn(
              label: Text(
                "Color",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              numeric: false,
            ),
            DataColumn(
              label: Text(
                "Thumbnail",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              numeric: false,
            ),
            DataColumn(
              label: Text(
                "Total Item",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              numeric: false,
            ),
            DataColumn(
              label: Text(
                "Action",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              numeric: false,
            )
          ],
          rows: datas
              .map(
                (datas) => DataRow(
                  cells: [
                    DataCell(
                      Text(datas.name),
                    ),
                    DataCell(Container(
                      height: 20,
                      width: 20,
                      color: Colors.black,
                    )),
                    DataCell(Image.asset(
                      "assets/food/burger.png",
                      width: 35,
                      height: 35,
                    )),
                    DataCell(
                      Text(
                        datas.totalitem.toString(),
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _searchBarItems() {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: SearchBar(),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                EntriesShowBtn(
                     entries: datas.length,
                    ),
                SizedBox(
                  width: 5,
                ),
                AddEntriesBtn(),
              ],
            ),
          ),
          addnewBtn(
            onPress: () {
              // _quantityControllerState.onAddQuantityClick();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 25,
        ),
        color: Color(0xffF4F4F4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _searchBarItems(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: dataBody(),
            )
          ],
        ),
      ),
    );
  }
}
