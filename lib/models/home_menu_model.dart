import 'package:agri/screens/home/pages/agricultural_information/agricultural_information_page.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:flutter/material.dart';

class HomeMenuModel {
  final String title;
  final String subtitle;
  final String? iconImage;
  final String bg;
  final String screen;

  HomeMenuModel({
    required this.title,
    required this.subtitle,
    this.iconImage,
    required this.bg,
    required this.screen,
  });

  static final menus = [
    HomeMenuModel(
      title: 'ข้อมูล',
      subtitle: 'กลุ่มเกษตรกรของคุณ',
      iconImage: null,
      bg: ImageProviders.homeMenu1,
      screen: AppRoutes.agriculturalInformationPage,
    ),
    HomeMenuModel(
      title: 'สถิติ',
      subtitle: 'การใช้งานเครื่องจักร',
      iconImage: ImageProviders.homeMenuIncress,
      bg: ImageProviders.homeMenu2,
      screen: AppRoutes.statisticsPage,
    ),
    HomeMenuModel(
      title: 'ข่าวสาร/\nประชาสัมพันธ์',
      subtitle: '',
      iconImage: null,
      bg: ImageProviders.homeMenu3,
      screen: AppRoutes.newsPage,
    ),
    HomeMenuModel(
      title: 'ตารางฝึกอบรม',
      subtitle: '',
      iconImage: null,
      bg: ImageProviders.homeMenu4,
      screen: AppRoutes.trainingSchedulePage,
    ),
    HomeMenuModel(
      title: 'เครื่องจักร',
      subtitle: '',
      iconImage: null,
      bg: ImageProviders.homeMenu5,
      screen: AppRoutes.machineryPage,
    ),
  ];
}
