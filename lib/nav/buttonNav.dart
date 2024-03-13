import 'package:clinicmangment/page/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../controler/color.dart';
import '../page/log.dart';
import '../page/report.dart';
import '../page/user.dart';

class Botton extends StatefulWidget {
  const Botton({Key? key}) : super(key: key);

  @override
  _BottonState createState() => _BottonState();
}

class _BottonState extends State<Botton> {
  late PersistentTabController _controller;
  final homeController = Get.put(homeControler());

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        Dashbord(),
        UserPage() ,
        LogPage(),
        Report()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home_outlined),
          title: "Home",
          activeColorPrimary:  homeController.bluebackground.value,
          inactiveColorPrimary:  homeController.graybuton.value,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person_pin_outlined),
          title: "User",
          activeColorPrimary:  homeController.bluebackground.value,
          inactiveColorPrimary:  homeController.graybuton.value,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.file_copy_rounded),
          title: "Log",
          activeColorPrimary:  homeController.bluebackground.value,
          inactiveColorPrimary:  homeController.graybuton.value,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.bar_chart),
          title: "Report",
          activeColorPrimary:  homeController.bluebackground.value,
          inactiveColorPrimary:  homeController.graybuton.value,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
