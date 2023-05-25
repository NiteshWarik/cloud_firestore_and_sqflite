import 'package:final_review_app/src/config/router.dart';
import 'package:final_review_app/src/database/cloud_firestore_db.dart';
import 'package:final_review_app/src/database/database_helper.dart';
import 'package:final_review_app/src/features/signup/data/datasources/local/user_info_table.dart';
import 'package:final_review_app/src/features/signup/domain/models/user_info_db_model.dart';
import 'package:final_review_app/src/features/signup/presentation/widgets/textField_widget.dart';
import 'package:final_review_app/src/utils/resources.dart';
import 'package:final_review_app/src/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final databaseHelper = DatabaseHelper();
  bool internetCheck = false;
  NetWorkCheck noNetwork = NetWorkCheck();
  CloudFireStoreDatabase cloudFireStoreDatabase = CloudFireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text(
      //     'Sign Up',
      //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Form(
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  color: Colors.deepPurple.shade400,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              customTextWidget(Strings.firstName),
              CustomTextFormField(
                controller: _firstNameController,
                hintText: Strings.hintFirstName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Strings.firstNameValidation;
                  }
                  return null;
                },
              ),
              customTextWidget(Strings.lastName),
              CustomTextFormField(
                controller: _lastNameController,
                hintText: Strings.hintLastName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Strings.lastNameValidation;
                  }
                  return null;
                },
              ),
              customTextWidget(Strings.email),
              CustomTextFormField(
                controller: _emailController,
                hintText: Strings.hintEmail,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Strings.emailValidation;
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              customTextWidget(Strings.mobileNumber),
              CustomTextFormField(
                controller: _mobileNumberController,
                hintText: Strings.hintMobileNumber,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Strings.mobileNumberValidation;
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Do something when the form is submitted

                        await databaseHelper.initDatabase();

                        _submitForm();
                        
                        Navigator.pushNamed(context, AppRoutes.dashboard);
                      }
                       _formKey.currentState?.reset();
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    internetCheck = await noNetwork.checkNetworkConnection();
    if (_formKey.currentState!.validate()) {
      final user = UserInfoDBModel(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text,
          mobileNumber: _mobileNumberController.text,
          isUploaded: internetCheck == true ? 1 : 0);
      final dbHelper = DatabaseHelper();
      if (user.toMap().isNotEmpty) {
        await dbHelper.insert(user.toMap(), UserInfoTable.TABLE_NAME);
        Fluttertoast.showToast(msg: 'User Data Inserted Successfully');
         _formKey.currentState?.reset();
        if (internetCheck == true) {
        await  cloudFireStoreDatabase.addUser(
              _firstNameController.text, _lastNameController.text, _emailController.text, _mobileNumberController.text, '0');
              Fluttertoast.showToast(msg: 'User Data Inserted Successfully in Cloud Firestore Database');
               _formKey.currentState?.reset();
        }
      } else {
        Fluttertoast.showToast(msg: 'Something went wrong!!');
         _formKey.currentState?.reset();
      }
    }
  }
}
