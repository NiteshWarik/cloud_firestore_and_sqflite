import 'package:final_review_app/src/database/cloud_firestore_db.dart';
import 'package:final_review_app/src/database/database_helper.dart';
import 'package:final_review_app/src/features/dashboard/presentation/widgets/card_widget.dart';
import 'package:final_review_app/src/features/signup/domain/models/user_info_db_model.dart';
import 'package:final_review_app/src/utils/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';

class OfflineTabbar extends StatefulWidget {
  const OfflineTabbar({super.key});

  @override
  State<OfflineTabbar> createState() => _OfflineTabbarState();
}

class _OfflineTabbarState extends State<OfflineTabbar> {
  DashboardCustomWidgets dashboardCustomWidgets = DashboardCustomWidgets();
  final dbHelper = DatabaseHelper();

  List<UserInfoDBModel> userdatalist = [];
  // Future<List<UserInfoDBModel>> getData() async {
  //   // Fetch data from the database

  //   List<Map<String, dynamic>> data = await dbHelper.getUnsyncedUsers();

  //   if (data.isNotEmpty) {
  //     print('fetchDataFromDb >>> $data');
  //     data.forEach((element) {
  //       userdatalist.add(UserInfoDBModel.fromJson(element));
  //     });
  //   }
  //   return userdatalist;
  // }

  bool internetCheck = false;
  NetWorkCheck noNetwork = NetWorkCheck();
  CloudFireStoreDatabase cloudFireStoreDatabase = CloudFireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: SizedBox(
          //width: MediaQuery.of(context).size.width * 0.20,
          height: MediaQuery.of(context).size.height * 0.05,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white),
            onPressed: () async {
              internetCheck = await noNetwork.checkNetworkConnection();
              if (internetCheck == false) {
                Fluttertoast.showToast(msg: 'Internet Connect Required');
              } else {
                await cloudFireStoreDatabase.uploadDataToFirestore();
                setState(() {});
              }
            },
            child: const Text(
              'Sync Now',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
          future: dbHelper.getUnsyncedUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return dashboardCustomWidgets.customOnlineCard(
                        snapshot.data![index]['first_name'],
                        snapshot.data![index]['last_name'],
                        snapshot.data![index]['email'],
                        snapshot.data![index]['mobile_number'],
                      );
                    });
              } else {
                return const Center(
                  child: Text('No Data Found'),
                );
              }
            } else {
              return Center(child: Text(snapshot.hasError.toString()));
            }
          }),
    );
  }
}
