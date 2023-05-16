

import 'package:bloc_rest_api_demo/pages/employee/employeeentry/bloc/employee_entry_bloc.dart';
import 'package:bloc_rest_api_demo/pages/employee/employeelist/bloc/employee_bloc.dart';
import 'package:bloc_rest_api_demo/pages/employee/repository/employeerepository.dart';
import 'package:bloc_rest_api_demo/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/locator.dart';
import '../homepage/homepage.dart';

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>EmployeeBloc(employeeRepository: EmployeeRepository())),
      BlocProvider(create: (_)=>EmployeeEntryBloc(employeeRepository: EmployeeRepository()))
    ],
    child: MaterialApp(
      navigatorKey: locator<NavigatorService>().navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    ));
  }
}