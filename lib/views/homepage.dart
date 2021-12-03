import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../enums.dart';
import '../models/menu_info.dart';
import '../data.dart';
import 'package:clock_app/views/alarm_page.dart';
import 'package:clock_app/views/clock_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((e) => buildMenuFlatButton(e)).toList(),
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1.5,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (context, value, child) {
                if (value.menuType == MenuType.clock) return ClockPage();
                else if (value.menuType == MenuType.alarm) return AlarmPage();
                else{
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuFlatButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child) {
        return FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
          color: currentMenuInfo.menuType == value.menuType
              ? Color(0xFF2D2F25)
              : Colors.transparent,
          onPressed: () {
            var menuinfo = Provider.of<MenuInfo>(context, listen: false);
            menuinfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: [
              Icon(
                currentMenuInfo.iconData,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(height: 16),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(
                  fontFamily: 'avenir',
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}