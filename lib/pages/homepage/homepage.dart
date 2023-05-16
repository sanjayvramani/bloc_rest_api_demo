
import 'package:bloc_rest_api_demo/pages/employee/employeelist/employeelist.dart';
import 'package:bloc_rest_api_demo/services/navigator_service.dart';
import 'package:flutter/material.dart';

import '../../services/locator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final NavigatorService _navigatorService = locator<NavigatorService>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Rest API Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ElevatedButton(onPressed: (){
              _navigatorService.pushPage(widget:  EmployeeList());
             }, child: const Text('Employee Master'))
          ],
        ),
      ),
    );
  }
}
