import 'package:flutter/material.dart';
import 'package:food/controller/adminController.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';

class AdminDashBoard extends StatelessWidget {
  AdminController adminController;
  double height;
  double width;
  bool isMenuFixed(BuildContext context) {
    return MediaQuery.of(context).size.width > 500;
  }

  @override
  Widget build(BuildContext context) {
    height = Get.height;
    width = Get.width;
    return _contentBody();
  }

  Widget _contentBody() {
    return Expanded(
      child: Container(
        color: Color(0xffF4F4F4),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              customSizedBoxed(height: 20),
              SearchBarItems(),
              customSizedBoxed(height: 10),
              _financeDataCard(),
              customSizedBoxed(height: 20),
              _paymentData(),
              customSizedBoxed(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentData() {
    return getDeviceType()
        ? _mobileViewPaymentData()
        : _tabletViewPaymentData();
  }

  Widget _tabletViewPaymentData() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(flex: 3, child: _recentsTransaction(text: "Recent Payments")),
        Expanded(flex: 3, child: _recentsPending(text: "Recent Pending")),
        Expanded(flex: 4, child: _customerStat())
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
                flex: 1, child: _recentsTransaction(text: "Recent Payments")),
            Expanded(flex: 1, child: _recentsPending(text: "Recent Pending")),
            customSizedBoxed(width: 20)
          ],
        ),
        customSizedBoxed(height: 20),
        _customerStat()
      ],
    );
  }

  Widget _recentsTransaction({String text}) {
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
                customBoldText(text: text),
                customFixedDivider(),
                _eachUserPayDetail(
                    name: "Niraj Karanjeet",
                    amount: "1000",
                    paymentGetway: "via eSewa"),
                customSizedBoxed(height: 20),
                _eachUserPayDetail(
                    name: "Niruta Devkota",
                    amount: "2000",
                    paymentGetway: "via Khati"),
                customSizedBoxed(height: 20),
                _eachUserPayDetail(
                  name: "Kriti Gurung",
                  amount: "2000",
                  paymentGetway: "via Cash",
                ),
              ],
            ),
          ),
          _viewAll(),
        ],
      ),
    );
  }

  Widget _viewAll() {
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

  Widget _recentsPending({String text}) {
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
                customBoldText(text: text),
                customFixedDivider(),
                _eachUserPayDetail(
                  name: "Niraj Karanjeet",
                  amount: "1110",
                ),
                customSizedBoxed(height: 20),
                _eachUserPayDetail(
                  name: "Niruta Devkota",
                  amount: "5000",
                ),
                customSizedBoxed(height: 20),
                _eachUserPayDetail(
                  name: "Kriti Gurung",
                  amount: "9000",
                ),
              ],
            ),
          ),
          _viewAll(),
        ],
      ),
    );
  }

  Widget _customerStat() {
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
            customSizedBoxed(
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

  Widget _financeDataCard() {
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
            child: customBoldText(text: name),
          ),
          customFixedDivider(),
          for (var i = 0; i < adminController.info["clientIdList"].length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: (Row(
                children: [
                  customSizedBoxed(
                    width: 7,
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 15,
                  ),
                  customSizedBoxed(
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
          child: customBoldText(text: name),
        ),
        customFixedDivider(),
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
}
