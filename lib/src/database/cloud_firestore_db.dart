import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_review_app/src/database/database_helper.dart';
import 'package:final_review_app/src/features/signup/data/datasources/local/user_info_table.dart';
import 'package:final_review_app/src/features/signup/domain/models/user_info_db_model.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CloudFireStoreDatabase {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser(
      String firstname, lastname, emailid, mobileno, isUploaded) async {
    await users.add({
      'first_name': firstname,
      'last_name': lastname,
      'email': emailid,
      'mobile_number': mobileno,
      'is_uploaded': isUploaded,
    });
  }

  Future<void> getUsers() async {
    QuerySnapshot querySnapshot = await users.get();

    for (var doc in querySnapshot.docs) {
      print(doc.data());
    }
  }

  Future<void> deleteUser() async {
    QuerySnapshot querySnapshot =
        await users.where('name', isEqualTo: 'John Doe').get();

    querySnapshot.docs.forEach((doc) async {
      await users.doc(doc.id).delete();
    });
  }

  Future<void> uploadDataToFirestore() async {
    //List<UserInfoDBModel> toUploadUserDetails = [];
    final dbHelper = DatabaseHelper();
    List<Map<String, dynamic>> data = await dbHelper.getUnsyncedUsers();
    //bool isUploadedToFirestore = false;
    for (var item in data) {
      users.add({
        'id': item[UserInfoTable.COLUMN_ID].toString(),
        'first_name': item[UserInfoTable.COLUMN_FIRST_NAME],
        'last_name': item[UserInfoTable.COLUMN_LAST_NAME],
        'email': item[UserInfoTable.COLUMN_EMAIL],
        'mobile_number': item[UserInfoTable.COLUMN_MOBILE_NUMBER],
      }).then((value) async {
        await dbHelper.updateIsUploaded();
        Fluttertoast.showToast(
            msg: 'Local Database Updated and Synced to Firestore Successfully');
            
      });
    }

//Second Try
    // Map<String, dynamic> userMap =
    //     toUploadUserDetails.map((usersdata) => usersdata.toMap()) as Map<String, dynamic>;
    //if (toUploadUserDetails.isNotEmpty) {
    //  var studentsmap = toUploadUserDetails.map((e){
    //     return {
    //             "first_name": e.firstName,
    //             "last_name": e.lastName,
    //             "email": e.email,
    //             "mobile_number": e.mobileNumber,
    //             "is_uploaded" : e.isUploaded
    //         };
    // }).toList();

//       users
//     .doc('document_id') // <-- Document ID
//     .set({'data': FieldValue.arrayUnion(  toUploadUserDetails
// )}) // <-- Add data
//     .then((_) => print('Added'))
//     .catchError((error) => print('Add failed: $error'));

    //   await users.add(toUploadUserDetails);
    //   isUploadedToFirestore = true;
    //   Fluttertoast.showToast(msg: 'Data Synced Successfully in Firestore');
    // }

    // if (isUploadedToFirestore == true) {
    //   for (int i = 0; i < data.length; i++) {
    //     dbHelper.updateIsUploaded();
    //   }
    //   Fluttertoast.showToast(msg: 'Local Database Updated Successfully');
    // } else {
    //   Fluttertoast.showToast(msg: 'Error occurred while sync to firestore');
    // }

//First Try
    // List<UserInfoDBModel> userdatalist = [];
    // List<Map<String, dynamic>> data;
    // final dbHelper = DatabaseHelper();
    // bool isUploadedToFirestore = false;

    // Future<List<UserInfoDBModel>> getDataListOfUsers() async {
    //   // Fetch data from the database

    //   data = dbHelper.getUnsyncedUsers() as List<Map<String, dynamic>>;

    //   if (data.isNotEmpty) {
    //     print('fetchDataFromDb >>> $data');
    //     for (var element in data) {
    //       userdatalist.add(UserInfoDBModel.fromJson(element));
    //     }
    //   }
    //   return userdatalist;
    // }

    // List<Map<String, dynamic>> userMap =
    //     userdatalist.map((usersdata) => usersdata.toMap()).toList();
    // if (isUploadedToFirestore == false) {
    //   await users.add(userMap);
    //   isUploadedToFirestore = true;
    //   Fluttertoast.showToast(msg: 'Data Synced Successfully in Firestore');
    // }

    // //
    // if (isUploadedToFirestore == true) {
    //   for (int i = 0; i < userdatalist.length; i++) {
    //     dbHelper.updateIsUploaded();
    //   }
    //   Fluttertoast.showToast(msg: 'Local Database Updated Successfully');
    // } else {
    //   Fluttertoast.showToast(msg: 'Error occurred while sync to firestore');
    // }
  }
}
