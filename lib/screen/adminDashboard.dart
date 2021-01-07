import 'package:flutter/material.dart';
import 'package:food/controller/adminController.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';

class AdminDashBoard extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    height = Get.height;
    width = Get.width;
    return _ContentBody();
  }

  Widget _ContentBody() {
    return Expanded(
      child: Container(
        color: Color(0xffF4F4F4),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSizedBoxed(height: 20),
              _SearchBar(),
              CustomSizedBoxed(height: 10),
              _FinanceDataCard(),
              CustomSizedBoxed(height: 20),
              _PaymentData(),
              CustomSizedBoxed(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _PaymentData() {
    return getDeviceType()
        ? _mobileViewPaymentData()
        : _tabletViewPaymentData();
  }

  Widget _tabletViewPaymentData() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(flex: 3, child: _RecentsTransaction(text: "Recent Payments")),
        Expanded(flex: 3, child: _RecentsPending(text: "Recent Pending")),
        Expanded(flex: 4, child: _CustomerStat())
      ],
    );
  }

  Widget _mobileViewPaymentData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 1, child: _RecentsTransaction(text: "Recent Payments")),
            Expanded(flex: 1, child: _RecentsPending(text: "Recent Pending")),
            CustomSizedBoxed(width: 20)
          ],
        ),
        CustomSizedBoxed(height: 20),
        _CustomerStat()
      ],
    );
  }

  Widget _RecentsTransaction({String text}) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBoldText(text: text),
                CustomFixedDivider(),
                _eachUserPayDetail(
                    name: "Niraj Karanjeet",
                    amount: "1000",
                    paymentGetway: "via eSewa"),
                CustomSizedBoxed(height: 20),
                _eachUserPayDetail(
                    name: "Niruta Devkota",
                    amount: "2000",
                    paymentGetway: "via Khati"),
                CustomSizedBoxed(height: 20),
                _eachUserPayDetail(
                  name: "Kriti Gurung",
                  amount: "2000",
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
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBoldText(text: text),
                CustomFixedDivider(),
                _eachUserPayDetail(
                  name: "Niraj Karanjeet",
                  amount: "1110",
                ),
                CustomSizedBoxed(height: 20),
                _eachUserPayDetail(
                  name: "Niruta Devkota",
                  amount: "5000",
                ),
                CustomSizedBoxed(height: 20),
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
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 19),
        child: Image.asset(
          "icons/customer stat.jpg",
          scale: getDeviceType() ? 2.1 : 4.5,
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
            CustomSizedBoxed(
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
    return GetBuilder(
      init: AdminController(),
      builder: (AdminController adminController) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        elevation: 1,
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _data(
                  list: adminController.info["clientIdList"],
                  name: "Client ID"),
              _data(
                  list: adminController.info["businnessIdList"],
                  name: "Business ID"),
              _data(list: adminController.info["name"], name: "Name"),
              _data(list: adminController.info["contact"], name: "Contact"),
              _data(list: adminController.info["bonus"], name: "Bonus"),
              _data(list: adminController.info["limit"], name: "Limit"),
              _data(list: adminController.info["spend"], name: "Spend"),
              Divider(),
              _editData(name: "Actions"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _editData({String name}) {
    return GetBuilder(
      init: AdminController(),
      builder: (AdminController adminController) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CustomBoldText(text: name),
          ),
          CustomFixedDivider(),
          for (var i = 0; i < adminController.info["clientIdList"].length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: (Row(
                children: [
                  CustomSizedBoxed(
                    width: 7,
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 15,
                  ),
                  CustomSizedBoxed(
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
      ),
    );
  }

  Widget _data({var list, String name}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CustomBoldText(text: name),
        ),
        CustomFixedDivider(),
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

  Widget _SearchBar() {
    return Row(
      children: [
        CustomSizedBoxed(
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
        CustomSizedBoxed(
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
        CustomSizedBoxed(
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
        CustomSizedBoxed(
          width: 20,
          height: 0,
        ),
      ],
    );
  }
}
