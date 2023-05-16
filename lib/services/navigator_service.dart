import 'package:flutter/material.dart';

class NavigatorService
{
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushPage({required Widget widget}) async
  {
   // Navigator.of(context).push(route)

    navigatorKey.currentState?.push(MaterialPageRoute(builder: (context)=>widget));
  }

  Future<dynamic> goBack({dynamic result}) async
  {
    navigatorKey.currentState?.pop(result);
  }
}