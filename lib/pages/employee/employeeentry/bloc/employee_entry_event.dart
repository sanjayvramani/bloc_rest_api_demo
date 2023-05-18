

import 'package:bloc_rest_api_demo/pages/employee/model/employee_model.dart';
import 'package:equatable/equatable.dart';

abstract class EmployeeEntryEvent extends Equatable{
  late EmployeeModel employeeModel;
}

// ignore: must_be_immutable
class LoadEmployeeEntryEvent extends EmployeeEntryEvent
{
  LoadEmployeeEntryEvent({required EmployeeModel employeeModel})
  {
    super.employeeModel = employeeModel;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
