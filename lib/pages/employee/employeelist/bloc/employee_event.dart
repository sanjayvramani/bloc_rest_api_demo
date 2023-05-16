
import 'package:bloc_rest_api_demo/pages/employee/model/employee_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EmployeeEvent extends Equatable{}

class LoadEmployeeEvent extends EmployeeEvent
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

/* class AddEmployeeEvent extends EmployeeEvent
{
  final EmployeeModel employeeModel;
  AddEmployeeEvent({required this.employeeModel});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class EditEmployeeEvent extends EmployeeEvent
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class DeleteEmployeeEvent extends EmployeeEvent
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

} */