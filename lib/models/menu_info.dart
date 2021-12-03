import 'package:flutter/material.dart';
import 'package:clock_app/enums.dart';

class MenuInfo extends ChangeNotifier{

  String title;
  MenuType menuType;
  IconData iconData;

  MenuInfo (this.menuType, {this.title, this.iconData});

  updateMenu (MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.iconData = menuInfo.iconData;

    notifyListeners();
  }
}