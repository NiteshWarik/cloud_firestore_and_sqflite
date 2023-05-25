import 'package:final_review_app/src/features/dashboard/presentation/views/dashboard_tabbar.dart';
import 'package:final_review_app/src/features/signup/presentation/views/signup.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String dashboard = '/dashboard';
 

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => SignUpScreen(),
    dashboard: (context) => Dashboard(),
  };
}
