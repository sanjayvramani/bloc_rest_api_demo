

import 'package:bloc_rest_api_demo/pages/employee/model/employee_model.dart';
import 'package:bloc_rest_api_demo/services/navigator_service.dart';
import 'package:flutter/material.dart';

import '../../../../services/locator.dart';
import '../../employeeentry/employeeentry.dart';

class EmployeeWidget extends StatelessWidget {
  final EmployeeModel employeeModel;
   EmployeeWidget({super.key,
   required this.employeeModel});

   final NavigatorService _navigatorService = locator<NavigatorService>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
                        title: Text(employeeModel.getEmployeeName),
                        subtitle: Text(employeeModel.getEmployeeAge.toString()),
                        onTap: (){
                          _navigatorService.pushPage(widget: EmployeeEntry(
                            employeeModel: employeeModel,
                          ));
                        },
                      );
  }
}