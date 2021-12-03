import 'package:clock_app/enums.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/views/homepage.dart';
import 'package:provider/provider.dart';
import 'models/menu_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(MenuType.clock),
        child: MyHomePage(),
      ),
    );
  }
}
 