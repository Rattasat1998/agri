import 'package:agri/screens/machinery_map/bloc/machinery_map_bloc.dart';
import 'package:agri/screens/news/blocs/news_bloc/news_bloc.dart';
import 'package:agri/screens/profile/bloc/profile_bloc.dart';
import 'package:agri/screens/profile/profile_screen.dart';
import 'package:agri/screens/screens.dart';
import 'package:agri/screens/setting/setting_screen.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'home/home_screen.dart';
import 'home/pages/machinery/bloc/machinery_bloc.dart';
import 'machinery_map/machinery_map_screen.dart';
import 'news/news_page.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 2;
  int _pavIndex = 2;

  final List<Widget> _pages = [
    const NewsPage(),
    const MachineryMapScreen(),
     const HomeScreen(),
    const ProfileScreen(),
    const SettingScreen(),
  ];

  List<dynamic> menu = [];

  void _setLoadingStyle(){
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 4.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.black.withOpacity(0.8)
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.8)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setLoadingStyle();
  }


  @override
  Widget build(BuildContext context) {
    menu = [
      CupertinoIcons.doc_plaintext,
      CupertinoIcons.placemark_fill,
      '',
      CupertinoIcons.person,
      Icons.settings
    ];
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff113301),
        height: 70,
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: menu.map((e) {
                final index = menu.indexOf(e);
                return e == ''
                    ? const Expanded(flex: 3, child: SizedBox())
                    : Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 70,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                context.read<ProfileBloc>().add(GetProfileEvent());
                                if (index == 4) {
                                  await Navigator.pushNamed(context, AppRoutes.settingScreen);
                                  _currentIndex = 2;
                                  setState(() {});
                                } else if(index == 0){
                                  context.read<NewsBloc>().add(NewsInitialEvent());
                                  await Navigator.pushNamed(context, AppRoutes.newsPage);
                                  _currentIndex = 2;
                                  setState(() {});

                                } else if(index == 3){
                                  context.read<ProfileBloc>().add(GetProfileEvent());
                                  // await Navigator.pushNamed(context, AppRoutes.profileScreen);
                                  _currentIndex = index;
                                  setState(() {});
                                }  else if(index == 1){
                                  context.read<MachineryBloc>().add(MachineryInitialEvent());
                                  // await Navigator.pushNamed(context, AppRoutes.profileScreen);
                                  _currentIndex = index;
                                  setState(() {});
                                } else {
                                  setState(() => _currentIndex = index);
                                }
                              },
                              child: Icon(
                                e,
                                color: _currentIndex == index ? Colors.white : Colors.white38,
                              ),
                            ),
                          ),
                        ),
                      );
              }).toList(),
            ),
            Positioned(
                top: -20,
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: _currentIndex != 2 ? Colors.grey.shade600 : Colors.white,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor:
                          _currentIndex == 2 ? const Color(0xff184B00) : const Color(0xff113301),
                      child: AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 1000),
                        child: Icon(
                          CupertinoIcons.home,
                          color: _currentIndex == 2 ? Colors.white : Colors.white38,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
