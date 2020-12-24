import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminAdvanceCredit extends StatelessWidget {
  var realOrientation;
  double height;

  double width;

  bool isMenuFixed(BuildContext context) {
    return MediaQuery.of(context).size.width > 500;
  }

  bool getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    print(data.size.shortestSide < 600 ? 'phone' : 'tablet');
    return data.size.shortestSide < 600 ? true : false;
  }

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
    realOrientation = MediaQuery.of(context).orientation;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print(realOrientation.toString() + " realOrientation");

    if (getDeviceType()) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    return Scaffold(
      drawer: (getDeviceType() ||
              (getDeviceType() == false &&
                  getOpacityForOrientation(context) == 1))
          ? _MenuSideBar(context)
          : null,
      appBar: _AppBar(),
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  int getOpacityForOrientation(context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return 0;
    } else {
      return 1;
    }
  }

  Widget _body(context) {
    print(realOrientation.toString() + " orientation");
    return Row(
      children: [
        (getDeviceType() == false && getOpacityForOrientation(context) == 0)
            ? _MenuSideBar(context)
            : SizedBox(),
        _ContentBody(),
      ],
    );
  }

  Widget _ContentBody() {
    return Expanded(
      child: Container(
        color: Color(0xffF4F4F4),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _CustomSizedBoxed(height: 20),
              _SearchBar(),
              _CustomSizedBoxed(height: 10),
              _FinanceDataCard(),
              _CustomSizedBoxed(height: 20),
              _PaymentData(),
              _CustomSizedBoxed(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _PaymentData() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
            flex: getDeviceType() ? 5 : 3,
            child: _RecentsTransaction(text: "Recent Payments")),
        Expanded(
            flex: getDeviceType() ? 5 : 3,
            child: _RecentsPending(text: "Recent Pending")),
        Expanded(flex: getDeviceType() ? 6 : 4, child: _CustomerStat())
      ],
    );
  }

  Widget _RecentsTransaction({String text}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(getDeviceType() ? 12 : 17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CustomBoldText(text: text),
                _CustomFixedDivider(),
                _eachUserPayDetail(
                    name: "Niraj Karanjeet",
                    amount: "10000",
                    paymentGetway: "via eSewa"),
                _CustomSizedBoxed(height: 20),
                _eachUserPayDetail(
                    name: "Niruta Devkota",
                    amount: "20000",
                    paymentGetway: "via Khati"),
                _CustomSizedBoxed(height: 20),
                _eachUserPayDetail(
                  name: "Kriti Gurung",
                  amount: "20000",
                  paymentGetway: "via Cash",
                ),
              ],
            ),
          ),
          _ViewAll(),
        ],
      ),
    );
  }

  Widget _ViewAll() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.0,
        left: 8.0,
        right: 8.0,
        top: getDeviceType() ? 0 : 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "View All",
            style: TextStyle(fontSize: 10, color: Colors.green),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 10,
            color: Colors.green,
          )
        ],
      ),
    );
  }

  Widget _RecentsPending({String text}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      margin: EdgeInsets.only(left: getDeviceType() ? 10 : 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(getDeviceType() ? 12 : 17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CustomBoldText(text: text),
                _CustomFixedDivider(),
                _eachUserPayDetail(
                  name: "Niraj Karanjeet",
                  amount: "1110",
                ),
                _CustomSizedBoxed(height: 20),
                _eachUserPayDetail(
                  name: "Niruta Devkota",
                  amount: "5000",
                ),
                _CustomSizedBoxed(height: 20),
                _eachUserPayDetail(
                  name: "Kriti Gurung",
                  amount: "9000",
                ),
              ],
            ),
          ),
          _ViewAll(),
        ],
      ),
    );
  }

  Widget _CustomerStat() {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      margin: EdgeInsets.only(left: getDeviceType() ? 10 : 20, right: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 19),
        child: Image.asset(
          "icons/customer stat.jpg",
          scale: 4.5,
        ),
      ),
    );
  }

  Widget _eachUserPayDetail(
      {String name, String paymentGetway, String amount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 12,
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
                    fontSize: 13,
                  ),
                ),
                Text(
                  "12/15/2020",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Rs. $amount",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${paymentGetway == null ? " " : paymentGetway}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 9,
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
        _CustomFixedDivider(),
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
        _CustomFixedDivider(),
        for (final data in list)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data,
              style: TextStyle(fontSize: 12),
            ),
          ),
      ],
    );
  }

  Widget _CustomFixedDivider() {
    return Divider(
      height: 15,
      color: Color(0xffE8E8E8),
    );
  }

  Text _CustomBoldText({String text}) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    );
  }

  Widget _SearchBar() {
    return Row(
      children: [
        _CustomSizedBoxed(
          width: 16,
        ),
        Expanded(
          flex: 30,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            elevation: 2,
            child: Container(
              height: getDeviceType() ? 30 : height * .05,
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 6),
                    hintText: "Search....",
                    prefixIcon: Icon(
                      Icons.search,
                      size: 19,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
        ),
        _CustomSizedBoxed(
          width: 13,
        ),
        Expanded(
          flex: 8,
          child: Card(
            elevation: 2,
            color: Colors.white,
            child: Container(
              height: getDeviceType() ? 30 : height * .05,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Advance Credit",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
          ),
        ),
        _CustomSizedBoxed(
          width: 13,
          height: 0,
        ),
        Expanded(
            flex: 4,
            child: Container(
              height: getDeviceType() ? 30 : height * .05,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                color: Color(0xff7FC66E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
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

  double _MenuSidebarSizeMaintain(context) {
    if (getDeviceType() ||
        (!getDeviceType() && getOpacityForOrientation(context) == 1)) {
      return 180;
    } else if (!getDeviceType() && getOpacityForOrientation(context) == 0) {
      return width * 0.17;
    }
  }

  Widget _MenuSideBar(context) {
    return Container(
      color: Colors.green,
      width: _MenuSidebarSizeMaintain(context),
      child: Drawer(
        elevation: 0,
        child: ListView(
          children: [
            _CustomSizedBoxed(height: 15),
            _DashBoardMenus(icons: Icons.dashboard, text: "Dashboard"),
            _DashBoardMenus(icons: Icons.local_dining, text: "Orders"),
            _DashBoardMenus(icons: Icons.menu_book_rounded, text: "Menu"),
            _DashBoardMenus(icons: Icons.group_rounded, text: "Customer"),
            _DashBoardMenus(
              icons: Icons.star,
              text: "Credit",
              color: Color(0xff7FC66E),
              generalColor: Colors.white,
            ),
            _DashBoardMenus(icons: Icons.settings, text: "Settings"),
          ],
        ),
      ),
    );
  }

  Widget _DashBoardMenus(
      {IconData icons, String text, Color color, Color generalColor}) {
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

  Widget _AppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.green),
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
              radius: 16,
              backgroundImage: NetworkImage(
                  "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/122777514_4658406440867560_8980358279672578081_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=0gu5vxX82-oAX-gc96F&_nc_ht=scontent.fktm3-1.fna&oh=35af3a76207cc2e56368dbde03f20eee&oe=6000DDD1"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Niraj Karanjeet",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade600,
              size: 22,
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

// Container(
// decoration: BoxDecoration(
// color: color ?? Colors.white,
// borderRadius: BorderRadius.circular(5),
// ),
// margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
// padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
// child: Row(
// children: [
// Icon(
// icons,
// color: generalColor ?? Colors.black,
// ),
// SizedBox(
// width: 5,
// ),
// Text(
// text,
// style: TextStyle(color: generalColor ?? Colors.black),
// )
// ],
// ),
// ),
// leading: (getDeviceType() ||
// (getDeviceType() == false &&
// realOrientation == Orientation.portrait))
// ? Builder(
// builder: (BuildContext context) {
// return IconButton(
// icon: const Icon(
// Icons.menu,
// color: Colors.green,
// ),
// onPressed: () {
// Scaffold.of(context).openDrawer();
// },
// tooltip:
// MaterialLocalizations.of(context).openAppDrawerTooltip,
// );
// },
// )
// : null,
