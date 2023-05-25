import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:final_review_app/src/features/dashboard/domain/models/employee_list_model.dart';
import 'package:final_review_app/src/utils/base_dio.dart';
import 'package:final_review_app/src/utils/extensions.dart';
import 'package:flutter/foundation.dart';

class DashBoardDio {
  Future<EmployeeListModel> fetchEmployees() async {
    Dio dio =  ApiServices.getBaseDio();
    EmployeeListModel employeeListModel = EmployeeListModel();

    try {
      Response response = await dio.get(Urls.employeeEndpoint);
      if (response.statusCode == 200) {
       var response1 = response.data;
        employeeListModel =EmployeeListModel.fromJson(response.data);
      } else {
        debugPrint('Something Went Wrong while Api call');
      }
    } catch (e) {
      debugPrint('$e Catch Error ');
    }
    return employeeListModel;
  }
}
