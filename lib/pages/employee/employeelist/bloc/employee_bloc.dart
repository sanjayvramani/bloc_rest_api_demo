
import 'package:bloc_rest_api_demo/pages/employee/employeelist/bloc/employee_event.dart';
import 'package:bloc_rest_api_demo/pages/employee/employeelist/bloc/employee_state.dart';
import 'package:bloc_rest_api_demo/pages/employee/repository/employeerepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeBloc extends Bloc<EmployeeEvent,EmployeeState>
{
  final EmployeeRepository employeeRepository;
  EmployeeBloc({required this.employeeRepository}) : super(EmployeeLoadingState())
  {
    on<EmployeeEvent>((event, emit) async{

        emit(EmployeeLoadingState());
        try
        {
          final employees = await employeeRepository.getEmployees();
          emit(EmployeeLoadedState(employees: employees));
        }
        catch(e)
        {
          emit(EmployeeErrorState(error: e.toString()));
        }


    });
  }

}