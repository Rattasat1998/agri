import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarModel {
  final String title;
  final IconData icon;

  TabBarModel({required this.title, required this.icon});

  static final tabs = [
    TabBarModel(
      title: 'ที่ตั้ง',
      icon: Icons.place,
    ),
    TabBarModel(
      title: 'เครื่องจักร',
      icon: Icons.settings,
    ),
    TabBarModel(
      title: 'สมาชิก',
      icon: Icons.group,
    ),
  ];
}
