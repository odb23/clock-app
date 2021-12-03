import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime alamDateTime;
  String description;
  bool isActive;
  List<Color> gradientColors;

  AlarmInfo (this.alamDateTime, {this.description, this.gradientColors});

}