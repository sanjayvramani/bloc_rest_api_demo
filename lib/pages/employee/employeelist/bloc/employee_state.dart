

import 'package:bloc_rest_api_demo/pages/employee/model/employee_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EmployeeState extends Equatable{}

class EmployeeLoadingState extends EmployeeState
{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeeLoadedState extends EmployeeState
{
  final List<EmployeeModel> employees;
  EmployeeLoadedState({required this.employees});
  @override
  List<Object?> get props => [employees];
}

class EmployeeErrorState extends EmployeeState
{
  final String error;
  EmployeeErrorState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}