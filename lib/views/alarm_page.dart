import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/data.dart';
import 'package:intl/intl.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alarm',
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
                var alarmTime = DateFormat('hh:mm aa').format(alarm.alamDateTime); 
                return Container(
                  margin: EdgeInsets.only(bottom: 32),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: alarm.gradientColors,
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: alarm.gradientColors.last.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 4,
                        offset: Offset(4, 4),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Office',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'avenir'),
                              ),
                            ],
                          ),
                          Switch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        'Mon - Fri',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'avenir',
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            alarmTime,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 36,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).followedBy([
                if(alarms.length < 5)
                  DottedBorder(
                  strokeWidth: 3,
                  color: Color(0xFFEAECFF),
                  borderType: BorderType.RRect,
                  radius: Radius.circular(24),
                  dashPattern: [5,4],
                  child: Container(
                    width: double.infinity,                    decoration: BoxDecoration(
                      color: Color(0xFF444974),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(
                            Icons.add_alarm_outlined,
                            size: 50,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Add Alarm',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'avenir',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                else
                  Text("Only 5 alarms are allowed!"),
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
