import 'package:flutter/material.dart';

class AdminAdvanceCredit extends StatelessWidget {
  double height;
  double width;
  List clientIdList = [
    "0192",
    "0192",
    "0192",
    "0192",
    "0192",
    "0192",
  ];
  List businnessIdList = [
    "0293k",
    "8282w",
    "29399",
    "022",
    "2392e",
    "2234",
  ];
  List name = [
    "Kriti Gurung",
    "Sneha Thapa",
    "Chelsi Khetan",
    "Bhagyashree Thapa",
    "Niruta Devkota",
    "Anmol Devkota",
  ];
  List contact = [
    "9825374929",
    "9827324929",
    "9827374929",
    "9827374949",
    "9827371929",
    "9827372929",
  ];

  List bonus = [
    "Rs. 2000",
    "Rs. 1000",
    "Rs. 2000",
    "Rs. 2000",
    "Rs. 2000",
    "Rs. 2000",
  ];
  List limit = [
    "Rs. 20000",
    "Rs. 10000",
    "Rs. 20000",
    "Rs. 20000",
    "Rs. 20000",
    "Rs. 20000",
  ];
  List spend = [
    "Rs. 5000",
    "Rs. 1000",
    "Rs. 1000",
    "Rs. 100",
    "--",
    "Rs 2900",
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _AppBar(),
      backgroundColor: Color(0xffF4F4F4),
      body: _body(),
    );
  }

  Widget _body() {
    return Row(
      children: [
        _MenuSideBar(),
        _ContentBody(),
      ],
    );
  }

  Widget _ContentBody() {
    return Expanded(
      flex: 10,
      child: Column(
        children: [
          _CustomSizedBoxed(height: 20),
          _SearchBar(),
          _CustomSizedBoxed(height: 10),
          _FinanceDataCard(),
          _CustomSizedBoxed(height: 20),
          Row(
            children: [
              _RecentsTransaction(text: "Recent Payments"),
              _RecentsTransaction(text: "Recent Pending"),
            ],
          )
        ],
      ),
    );
  }

  Widget _RecentsTransaction({String text}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      margin: EdgeInsets.only(left: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CustomBoldText(text: text),
            Divider(
              height: 20,
              color: Colors.black,
            ),
            _eachUserPayDetail(
                name: "Niraj Karanjeet",
                amount: "10000",
                paymentGetway: "eSewa"),
            _CustomSizedBoxed(height: 20),
            _eachUserPayDetail(
                name: "Niruta Devkota",
                amount: "20000",
                paymentGetway: "Khati"),
            _CustomSizedBoxed(height: 20),
            _eachUserPayDetail(
                name: "Kriti Gurung",
                amount: "20000",
                paymentGetway: "Cash",
                width: 35),
          ],
        ),
      ),
    );
  }

  Widget _eachUserPayDetail(
      {String name, String paymentGetway, String amount, double width}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(
              "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/122777514_4658406440867560_8980358279672578081_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=0gu5vxX82-oAX-gc96F&_nc_ht=scontent.fktm3-1.fna&oh=35af3a76207cc2e56368dbde03f20eee&oe=6000DDD1"),
        ),
        _CustomSizedBoxed(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              "12/15/2020",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            )
          ],
        ),
        _CustomSizedBoxed(
          width: width ?? 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Rs. $amount",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              "via $paymentGetway",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _FinanceDataCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _data(list: clientIdList, name: "Client ID"),
            _data(list: businnessIdList, name: "Business ID"),
            _data(list: name, name: "Name"),
            _data(list: contact, name: "Contact"),
            _data(list: bonus, name: "Bonus"),
            _data(list: limit, name: "Limit"),
            _data(list: spend, name: "Spend"),
            Divider(),
            _editData(name: "Actions"),
          ],
        ),
      ),
    );
  }

  Widget _editData({String name}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _CustomBoldText(text: name),
        ),
        Divider(
          height: 10,
          thickness: 2,
          color: Colors.black,
        ),
        for (var i = 0; i < clientIdList.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: (Row(
              children: [
                _CustomSizedBoxed(
                  width: 7,
                ),
                Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 15,
                ),
                _CustomSizedBoxed(
                  width: 6,
                ),
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 15,
                ),
              ],
            )),
          )
      ],
    );
  }

  Widget _data({List list, String name}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _CustomBoldText(text: name),
        ),
        Divider(
          height: 10,
          thickness: 2,
          color: Colors.black,
        ),
        for (final data in list)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data),
          ),
      ],
    );
  }

  Text _CustomBoldText({String text}) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  Widget _SearchBar() {
    return Row(
      children: [
        _CustomSizedBoxed(
          width: 20,
          height: 0,
        ),
        Expanded(
          flex: 18,
          child: SizedBox(
            height: height * .06,
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 6),
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  enabled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(
                      color: Color(0xffCCCCCC),
                    ),
                  )),
            ),
          ),
        ),
        _CustomSizedBoxed(
          width: 20,
          height: 0,
        ),
        Expanded(
          flex: 6,
          child: RaisedButton.icon(
            onPressed: () {},
            color: Colors.white,
            label: Text("Advance Credit"),
            icon: Icon(Icons.keyboard_arrow_down_outlined),
          ),
        ),
        _CustomSizedBoxed(
          width: 20,
          height: 0,
        ),
        Expanded(
            flex: 3,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xff7FC66E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            )),
        _CustomSizedBoxed(
          width: 20,
          height: 0,
        ),
      ],
    );
  }

  Widget _CustomSizedBoxed({double height, double width}) {
    return SizedBox(height: height, width: width);
  }

  Widget _MenuSideBar() {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _DashBoardMenus(icons: Icons.dashboard_outlined, text: "Dashboard"),
            _DashBoardMenus(icons: Icons.food_bank_outlined, text: "Orders"),
            _DashBoardMenus(icons: Icons.menu_book_outlined, text: "Menu"),
            _DashBoardMenus(
              icons: Icons.star,
              text: "Credit",
              color: Color(0xff7FC66E),
              generalColor: Colors.white,
            ),
            _DashBoardMenus(icons: Icons.settings_outlined, text: "Settings"),
          ],
        ),
      ),
    );
  }

  GestureDetector _DashBoardMenus(
      {IconData icons, String text, Color color, Color generalColor}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          children: [
            Icon(
              icons,
              color: generalColor ?? Colors.black,
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

  Widget _AppBar() {
    return AppBar(
      title: Text(
        "FOODIZM",
        style: TextStyle(
          color: Color(0xff7FC66E),
        ),
      ),
      actions: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/122777514_4658406440867560_8980358279672578081_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=0gu5vxX82-oAX-gc96F&_nc_ht=scontent.fktm3-1.fna&oh=35af3a76207cc2e56368dbde03f20eee&oe=6000DDD1"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Niraj Karanjeet",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black54,
            ),
            SizedBox(
              width: 30,
            ),
          ],
        )
      ],
      backgroundColor: Colors.white,
    );
  }
}
