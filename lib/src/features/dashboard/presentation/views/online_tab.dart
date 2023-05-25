import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_review_app/src/database/cloud_firestore_db.dart';
import 'package:final_review_app/src/features/dashboard/domain/models/employee_list_model.dart';
import 'package:final_review_app/src/features/dashboard/presentation/bloc/employee_list_bloc.dart';
import 'package:final_review_app/src/features/dashboard/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class OnlineTabBarForFirestore extends StatefulWidget {
  const OnlineTabBarForFirestore({super.key});

  @override
  State<OnlineTabBarForFirestore> createState() =>
      _OnlineTabBarForFirestoreState();
}

class _OnlineTabBarForFirestoreState extends State<OnlineTabBarForFirestore> {
  DashboardCustomWidgets dashboardCustomWidgets = DashboardCustomWidgets();
  EmployeeListBloc employeeListBloc = EmployeeListBloc();

 

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');
  CloudFireStoreDatabase cloudFireStoreDatabase = CloudFireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: _collectionRef.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                  if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                    return ListView.builder(
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return dashboardCustomWidgets.customOnlineCard(
                              data['first_name'],
                              data['last_name'],
                              data['email'],
                              data['mobile_number']);
                        });
                  } else {
                    return const Center(
                      child:  Text('No data found'),
                    );
                  }
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}
