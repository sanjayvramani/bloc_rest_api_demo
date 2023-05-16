import 'package:bloc_rest_api_demo/config/appconfig.dart';
import 'package:bloc_rest_api_demo/pages/employee/employeeentry/bloc/employee_entry_event.dart';
import 'package:bloc_rest_api_demo/pages/employee/employeeentry/bloc/employee_entry_state.dart';
import 'package:bloc_rest_api_demo/pages/employee/repository/employeerepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class EmployeeEntryBloc extends Bloc<EmployeeEntryEvent, EmployeeEntryState> {
  final EmployeeRepository employeeRepository;
  EmployeeEntryBloc({required this.employeeRepository})
      : super(EmployeeEntryDoing()) {
    on<EmployeeEntryEvent>((event, emit) async {
      String baseUrl = AppConfig.BASE_URL;
      emit(EmployeeEntryProgress());
      try
        {
          late Response response;
          if (event.employeeModel.id == null) {
            response = await post(Uri.parse('$baseUrl/create'), body: {
              "name": event.employeeModel.getEmployeeName,
              "age": event.employeeModel.getEmployeeAge.toString(),
              "salary": event.employeeModel.getEmployeeSalary.toString()
            });
            print(response.body);
          }
          if (response.statusCode == 200)
          {
            emit(EmployeeEntryDone(response: response.body));
          }
      }
      catch (e)
      {
        emit(EmployeeEntryError(errorMessage: e.toString()));
      }
    });
  }
}
