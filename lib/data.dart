import 'models/menu_info.dart';
import 'package:flutter/material.dart';
import 'enums.dart';
import 'package:clock_app/models/alarm_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(
    MenuType.clock,
    title: 'Clock',
    iconData: Icons.lock_clock,
  ),
  MenuInfo(
    MenuType.alarm,
    title: 'Alarm',
    iconData: Icons.alarm,
  ),
  MenuInfo(
    MenuType.timer,
    title: "Timer",
    iconData: Icons.timer,
  ),
  MenuInfo(
    MenuType.stopWatch,
    title: 'Stopwatch',
    iconData: Icons.watch,
  )
];

List<AlarmInfo> alarms = [
  AlarmInfo(
    DateTime.now().add(Duration(hours: 1)),
    description: "Office",
    gradientColors: GradientColors.sky,
  ),
  AlarmInfo(
    DateTime.now().add(Duration(hours: 2)),
    description: "Sports",
    gradientColors: GradientColors.sunset,
  ),
];

class GradientColors {
  static List<Color> sky = [
    Color(0xFF6448FE),
    Color(0xFF5FC6FF),
  ];
  static List<Color> sunset = [
    Color(0xFFFE6197),
    Color(0xFFFFB463),
  ];
  static List<Color> sea = [
    Color(0xFF61A3FE),
    Color(0xFF63FFD5),
  ];
  static List<Color> mango = [
    Color(0xFFFFA738),
    Color(0xFFFFE130),
  ];
}
