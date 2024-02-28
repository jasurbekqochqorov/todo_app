import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework12/screens/on_boarding/on_boarding_screen.dart';
import 'package:homework12/screens/splash/splash_screen.dart';
import 'package:homework12/screens/tab/tab_box.dart';
import 'package:homework12/screens/welcome/welcome_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RouteNames.splashScreen:
      {
    return navigate(const SplashScreen());
    }

      case RouteNames.onBoardingScreen:
        {
          return navigate(const OnBoardingScreen());
        }

      case RouteNames.welcomeScreen:
        {
          return navigate(const WelcomeScreen());
        }

      case RouteNames.tabBox:
        {
          return navigate(const TabBox());
        }

      default:{
          return navigate(const Scaffold(body: Center(child: Text('Bunday screen yoq'),),));
    }

    }
  }
  static navigate(Widget widget){
    return MaterialPageRoute(builder: (context)=>widget);
  }
}

class RouteNames{
  static const String splashScreen='/';
  static const String onBoardingScreen='/first_route';
  static const String welcomeScreen='/second_route';
  static const String tabBox='/third_route';
}