import 'package:final_review_app/src/features/dashboard/domain/models/employee_list_model.dart';
import 'package:final_review_app/src/features/dashboard/presentation/bloc/employee_list_bloc.dart';
import 'package:final_review_app/src/features/dashboard/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class OnlineTabBar extends StatefulWidget {
  const OnlineTabBar({super.key});

  @override
  State<OnlineTabBar> createState() => _OnlineTabBarState();
}

class _OnlineTabBarState extends State<OnlineTabBar> {
  DashboardCustomWidgets dashboardCustomWidgets = DashboardCustomWidgets();
  EmployeeListBloc employeeListBloc = EmployeeListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeListBloc.getEmployeeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<EmployeeListModel>(
            stream: employeeListBloc.employeeDetailsStream,
            builder: (context, snapshot) {
              if(snapshot.hasData ){
                 const Center(
                    child: CircularProgressIndicator(),
                  );
                if(snapshot.data!.data != null && snapshot.data!.data!.isNotEmpty){
                 return ListView.builder(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    return dashboardCustomWidgets.customCard(snapshot.data!,index);
                  });
              }else{
                return Center(
                    child: const Text('No data found'),
                  );
              }
              }else if(snapshot.hasError){
                return Text(snapshot.error.toString());
              }
              return const Center(
              child: CircularProgressIndicator(),
            );
             
            } 
          ),
        ],
      ),
    );
  }
}
