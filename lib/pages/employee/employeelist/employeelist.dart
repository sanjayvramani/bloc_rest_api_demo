

import 'package:bloc_rest_api_demo/pages/employee/employeelist/bloc/employee_bloc.dart';
import 'package:bloc_rest_api_demo/pages/employee/employeelist/bloc/employee_event.dart';
import 'package:bloc_rest_api_demo/pages/employee/employeelist/bloc/employee_state.dart';
import 'package:bloc_rest_api_demo/pages/employee/employeeentry/employeeentry.dart';
import 'package:bloc_rest_api_demo/pages/employee/model/employee_model.dart';
import 'package:bloc_rest_api_demo/pages/employee/employeelist/widget/employeewidget.dart';
import 'package:bloc_rest_api_demo/services/locator.dart';
import 'package:bloc_rest_api_demo/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeList extends StatelessWidget {
   EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    return _EmployeeListView();
  }
}

class _EmployeeListView extends StatefulWidget {

  @override
  State<_EmployeeListView> createState() => __EmployeeListViewState();
}

class __EmployeeListViewState extends State<_EmployeeListView> {

  //EmployeeBloc employeeBloc = EmployeeBloc(employeeRepository: EmployeeRepository());

  final NavigatorService _navigatorService = locator<NavigatorService>();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<EmployeeBloc,EmployeeState> (builder: (context,state){
              if(state is EmployeeLoadingState)
              {
                return const Center(child: CircularProgressIndicator(),);
              }
              else if(state is EmployeeErrorState)
              {
                return Center(child: Text(state.error));
              }
              else if(state is EmployeeLoadedState)
              {
                final List<EmployeeModel> lstEmployeeModel = state.employees;
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: lstEmployeeModel.length,
                    itemBuilder: (context,index){
                      return EmployeeWidget(employeeModel: lstEmployeeModel[index]) ;
                    },
                );
              }
              return Container();
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _navigatorService.pushPage(widget: EmployeeEntry()).then((result) {
          if(result!=null)
          {
            _getData();
          }
        });
      },
      child: const Icon(Icons.add)),
    );
  }

  _getData()
  {
    _navigatorService.navigatorKey.currentContext?.read<EmployeeBloc>().add(LoadEmployeeEvent());
  }
}