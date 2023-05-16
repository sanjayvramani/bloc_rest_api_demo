

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EmployeeEntryState extends Equatable{}


class EmployeeEntryDoing extends EmployeeEntryState
{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeeEntryProgress extends EmployeeEntryState
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class EmployeeEntryDone extends EmployeeEntryState
{
  @override
  // TODO: implement props
  final dynamic response;
  EmployeeEntryDone({required this.response});
  List<Object?> get props => [response];
}

class EmployeeEntryError extends EmployeeEntryState
{
  final String errorMessage;
  EmployeeEntryError({required this.errorMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];

}