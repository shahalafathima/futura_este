import 'package:ff/ui/dashboard/dashboard.dart';
import 'package:ff/ui/profile/profile.dart';
import 'package:ff/ui/report/report.dart';
import 'package:flutter/material.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;
  TabNavigationItem(
      {required this.page, required this.title, required this.icon});
  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: Dashboard(),
          icon: Icon(Icons.home),
          title: Text("Dashboard"),
        ),
        TabNavigationItem(
          page: ChatPage(),
          icon: Icon(Icons.chat),
          title: Text("Chat"),
        ),
        TabNavigationItem(
          page: ProfilePage(),
          icon: Icon(Icons.screen_search_desktop_outlined),
          title: Text("User"),
        ),
      ];
}
