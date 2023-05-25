


import 'package:final_review_app/src/features/dashboard/presentation/views/api_tab.dart';
import 'package:final_review_app/src/features/dashboard/presentation/views/offline_tab.dart';
import 'package:final_review_app/src/features/dashboard/presentation/views/online_tab.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Tab> myTabs = const [
    Tab(text: 'API'),
    Tab(text: 'Online'),
    Tab(text: 'Offline'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body:  TabBarView(
          children: [
            // Content of tab 1
            OnlineTabBar(),
            // Content of tab 2
            OnlineTabBarForFirestore(),
            // Content of tab 3
           OfflineTabbar(),
          ],
        ),
      ),
    );
  }
}
