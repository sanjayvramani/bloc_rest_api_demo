import 'package:equatable/equatable.dart';

class EmployeeModel {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;


  get getId => this.id;

 set setId( id) => this.id = id;

  get getEmployeeName => this.employeeName;

 set setEmployeeName( employeeName) => this.employeeName = employeeName;

  get getEmployeeSalary => this.employeeSalary;

 set setEmployeeSalary( employeeSalary) => this.employeeSalary = employeeSalary;

  get getEmployeeAge => this.employeeAge;

 set setEmployeeAge( employeeAge) => this.employeeAge = employeeAge;

  get getProfileImage => this.profileImage;

 set setProfileImage( profileImage) => this.profileImage = profileImage;

  EmployeeModel.fromJson(Map<String,dynamic> json)
  {
     id = json['id'];
     employeeName = json['employee_name'];
     employeeSalary = json['employee_salary'];
     employeeAge = json['employee_age'];
     profileImage = json['profile_image'];
  }

  EmployeeModel();

}