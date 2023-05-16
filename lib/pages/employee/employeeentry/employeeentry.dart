



import 'package:bloc_rest_api_demo/pages/employee/employeeentry/bloc/employee_entry_bloc.dart';
import 'package:bloc_rest_api_demo/pages/employee/employeeentry/bloc/employee_entry_event.dart';
import 'package:bloc_rest_api_demo/pages/employee/employeeentry/bloc/employee_entry_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/locator.dart';
import '../../../services/navigator_service.dart';

import '../model/employee_model.dart';

class EmployeeEntry extends StatefulWidget {
  EmployeeModel? employeeModel;
  EmployeeEntry({super.key,this.employeeModel});

  @override
  State<EmployeeEntry> createState() => _EmployeeEntryState();
}

class _EmployeeEntryState extends State<EmployeeEntry> {
  final NavigatorService _navigatorService = locator<NavigatorService>();

  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtAge = TextEditingController();
  final TextEditingController _txtSalary = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Entry"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<EmployeeEntryBloc,EmployeeEntryState>(
          builder: ((context, state) {
            return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            TextField(
              controller: _txtName,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                )
              ),
            ),
            const SizedBox(height: 16.0,),
            TextField(
              controller: _txtAge,
              decoration: const InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(
                )
              ),
            ),
            const SizedBox(height: 16.0,),
            TextField(
              controller: _txtSalary,
              decoration: const InputDecoration(
                labelText: "Salary",
                border: OutlineInputBorder(
                )
              ),
            ),
            const SizedBox(height: 16.0,),
            ElevatedButton(onPressed: (){
              _saveData();
            }, child: const Text("Save"))
          ],
        );
          }), 
          listener: ((context, state) {
            if(state is EmployeeEntryProgress)
            {
              print('Action happening');
            }
            else if(state is EmployeeEntryDone)
            {
             // state.response
              _navigatorService.goBack(result: state.response);
              //print('Action done');
            }
          })),
      ),
    );
  }

  _saveData()
  {

    if(widget.employeeModel==null)
    {
      final EmployeeModel employeeModel = EmployeeModel();
      employeeModel.employeeName = _txtName.text;
      employeeModel.employeeAge = int.parse(_txtAge.text);
      employeeModel.employeeSalary = int.parse(_txtSalary.text);
      _navigatorService.navigatorKey.currentContext?.read<EmployeeEntryBloc>().add(LoadEmployeeEntryEvent(employeeModel: employeeModel));
    }
   

    //_navigatorService.navigatorKey.currentContext?.re
    //.read<EmployeeBloc>().add(LoadEmployeeEvent());

    
  }

}