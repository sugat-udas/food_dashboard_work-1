import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xffD9D9D9),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Container(
        height: _height,
        width: _width,
        child: ListView(
          children: [
            UserInfo(),
            SizedBox(
              height: 10,
            ),
            IconCard(),
            SizedBox(
              height: 20,
            ),
            _Menu(),
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            "icons/profile-user.png",
            color: Colors.black45,
            scale: 1.2,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kriti Gurung",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                "Kritigurung813@gmail.com",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              SizedBox(
                height: 13,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Card(
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralSize(text: "General"),
            MenuIconWithText(
                text: "My Account",
                iconData: Icons.account_circle_outlined,
                trailingIcon: Icons.arrow_forward_ios),
            MenuIconWithText(
                text: "Payment",
                iconData: Icons.payment_outlined,
                trailingIcon: Icons.arrow_forward_ios),
            GeneralSize(text: "Notification"),
            MenuIconWithText(
                iconData: Icons.notifications_outlined,
                text: "Notification",
                trailingIcon: Icons.toggle_on_outlined,
                color: Colors.black87,
                iconSize: 31.0),
            GeneralSize(text: "More"),
            MenuIconWithText(
                iconData: Icons.history_outlined,
                text: "History",
                trailingIcon: Icons.arrow_forward_ios),
            MenuIconWithText(
                iconData: Icons.settings_outlined,
                text: "Settings",
                trailingIcon: Icons.arrow_forward_ios),
            MenuIconWithText(
                iconData: Icons.chat_outlined,
                text: "FAQ",
                trailingIcon: Icons.arrow_forward_ios),
            MenuIconWithText(
              iconData: Icons.share_outlined,
              text: "Invite Friends",
            ),
            MenuIconWithText(iconData: Icons.logout, text: "Logout"),
            SizedBox(
              height: 7,
            )
          ],
        ),
      ),
    );
  }

  Padding GeneralSize({String text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Padding MenuIconWithText({
    IconData iconData,
    String text,
    Color color,
    IconData trailingIcon,
    double iconSize,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 10.0, left: 10.0, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: Colors.black87,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          Container(
            child: Icon(
              trailingIcon,
              size: iconSize ?? 24.0,
              color: color ?? Color(0xffD9D9D9),
            ),
          )
        ],
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: IconWithText(
                  icon: Icons.star, text: "Credits", colors: Colors.amber),
            ),
            CustomSizedBox(),
            Expanded(
              child: IconWithText(
                  icon: Icons.favorite, text: "Favourites", colors: Colors.red),
            ),
            CustomSizedBox(),
            Expanded(
              child: IconWithText(
                  icon: Icons.room, text: "Locations", colors: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Padding IconWithText({IconData icon, String text, Color colors}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
      child: Column(
        children: [
          Icon(
            icon,
            color: colors,
            size: 27,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 1,
      color: Color(0xffF2F2F2),
    );
  }
}
