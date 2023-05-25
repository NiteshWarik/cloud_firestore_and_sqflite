import 'dart:async';
import 'dart:convert';

import 'package:final_review_app/src/features/dashboard/domain/models/employee_list_model.dart';
import 'package:final_review_app/src/features/dashboard/domain/repositories/employee_list_repo.dart';
import 'package:rxdart/rxdart.dart';

class EmployeeListBloc {
  final EmployeeListRepo employeeListRepo = EmployeeListRepo();

  // final _employeesController = StreamController<List<EmployeeListModel>>();
  // Sink<List<EmployeeListModel>> get _inEmployees => _employeesController.sink;
  // Stream<List<EmployeeListModel>> get employees => _employeesController.stream;

  final _employeeDetails = BehaviorSubject<EmployeeListModel>();
  get employeeDetailsStream => _employeeDetails.stream;

  Future getEmployeeDetails() async {
    EmployeeListModel employeeListModel =
        await employeeListRepo.getEmployeeDetails();
    _employeeDetails.sink.add(employeeListModel);
    // if (employeeListModel.data!.isNotEmpty) {

    // } else {
    //   _employeeDetails.sink.addError('Error Occured While Data Sink');
    // }
  }
}
