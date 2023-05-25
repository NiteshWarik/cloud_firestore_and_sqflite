import 'package:final_review_app/src/features/dashboard/data/datasources/remote/get_employee_dio.dart';
import 'package:final_review_app/src/features/dashboard/domain/models/employee_list_model.dart';

class EmployeeListRepo {
  final DashBoardDio dashboardDio = DashBoardDio();

  Future<EmployeeListModel> getEmployeeDetails() async =>
      dashboardDio.fetchEmployees();
}
