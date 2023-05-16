import 'dart:convert';

import 'package:bloc_rest_api_demo/config/appconfig.dart';
import 'package:bloc_rest_api_demo/pages/employee/model/employee_model.dart';
import 'package:http/http.dart';

class EmployeeRepository
{
  String baseUrl = AppConfig.BASE_URL;

  Future<List<EmployeeModel>> getEmployees() async
  {
    Response response = await get(Uri.parse("$baseUrl/employees"));
    if(response.statusCode==200)
    {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => EmployeeModel.fromJson(e)).toList();
    }
    else
    {
      throw Exception(response.reasonPhrase);
    }
  }

   Future<dynamic> addEmployee({required EmployeeModel employeeModel}) async
  {
    Map<String,dynamic> map = {
      "name" : employeeModel.getEmployeeName,
      "salary":employeeModel.getEmployeeSalary,
      "age":employeeModel.getEmployeeAge
    };

    final Response response = await post(Uri.parse("$baseUrl/create"),body: map);
    if(response.statusCode==200)
    {
      return response.body;
    }
    else
    {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<dynamic> editEmployee({required EmployeeModel employeeModel}) async
  {
    
  }

  Future<dynamic> deleteEmployee({required EmployeeModel employeeModel}) async
  {

  } 
}