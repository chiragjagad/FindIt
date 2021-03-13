//import 'dart:html';

import 'package:find_it/UI/AddItem.dart';
import 'package:find_it/UI/Requests.dart';
import 'package:find_it/UI/Search.dart';
import 'package:find_it/app_theme.dart';
import 'package:find_it/drawer/drawer_controller.dart';
import 'package:find_it/drawer/home_drawer.dart';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.Search) {
        setState(() {
          screenView = Search();
        });
      } else if (drawerIndex == DrawerIndex.Requests) {
        setState(() {
          screenView = Requests();
        });
      } else if (drawerIndex == DrawerIndex.Add) {
        setState(() {
          screenView = AddItem();
        });
      } else {
        //do in your way......
      }
    }
  }
}