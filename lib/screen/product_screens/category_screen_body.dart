import 'package:flutter/material.dart';
import 'package:food/constants/customFonts.dart';
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
  List listHeader = ['Name', 'Color', 'Thumbnail', 'Total Item', "Action"];
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
          left: 15,
          right: 15,
        ),
        child: DataTable(
          columns: [
            for (var each in listHeader)
              DataColumn(
                label: Text(
                  each,
                  style: TextStyle(
                      fontSize: xHeaderFont, fontWeight: FontWeight.bold),
                ),
                numeric: false,
              ),
          ],
          rows: datas
              .map(
                (datas) => DataRow(
                  cells: [
                    DataCell(
                      Text(
                        datas.name,
                        style: TextStyle(fontSize: 14),
                      ),
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
                        style: TextStyle(fontSize: 14),
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
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 25,
      ),
      color: Color(0xffF4F4F4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _searchBarItems(),
          SizedBox(
            height: 25,
          ),
          Container(
            child: dataBody(),
          )
        ],
      ),
    );
  }
}
