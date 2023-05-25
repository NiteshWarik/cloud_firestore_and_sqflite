import 'package:final_review_app/src/features/dashboard/domain/models/employee_list_model.dart';
import 'package:final_review_app/src/features/signup/domain/models/user_info_db_model.dart';
import 'package:final_review_app/src/utils/strings.dart';
import 'package:flutter/material.dart';

class DashboardCustomWidgets {
  Widget customCard(EmployeeListModel employeeListModel, index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(     
        leading: const Icon(Icons.person),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
              ),
              child: RichText(
                text:  TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: Strings.firstName,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: employeeListModel.data![index].employeeName,
                      style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
              ),
              child: RichText(
                text:  TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: Strings.employeeAge,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: employeeListModel.data![index].employeeAge.toString(),
                      style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
              ),
              child: RichText(
                text:  TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: Strings.employeeSalary,
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: employeeListModel.data![index].employeeSalary.toString(),
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customOnlineCard( String firstname,lastname,email,mobilenumber) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(     
        leading: const Icon(Icons.person),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
              ),
              child: RichText(
                text:  TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: Strings.firstName,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: firstname,
                      style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
              ),
              child: RichText(
                text:  TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: Strings.lastName,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: lastname,
                      style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
              ),
              child: RichText(
                text:  TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: Strings.email,
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: email,
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
              ),
              child: RichText(
                text:  TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: Strings.mobileNumber,
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: mobilenumber,
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //   Widget customOfflineCard() {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: ListTile(     
  //       leading: const Icon(Icons.person),
  //       title: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.only(
  //               top: 4.0,
  //               bottom: 4.0,
  //             ),
  //             child: RichText(
  //               text:  TextSpan(
  //                 children: <TextSpan>[
  //                   const TextSpan(
  //                     text: Strings.firstName,
  //                     style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
  //                   ),
  //                   TextSpan(
  //                     text: snapshot.firstName,
  //                     style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w700),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(
  //               top: 4.0,
  //               bottom: 4.0,
  //             ),
  //             child: RichText(
  //               text:  TextSpan(
  //                 children: <TextSpan>[
  //                   const TextSpan(
  //                     text: Strings.lastName,
  //                     style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
  //                   ),
  //                   TextSpan(
  //                     text: snapshot.lastName,
  //                     style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w700),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(
  //               top: 4.0,
  //               bottom: 4.0,
  //             ),
  //             child: RichText(
  //               text:  TextSpan(
  //                 children: <TextSpan>[
  //                   const TextSpan(
  //                     text: Strings.email,
  //                     style: TextStyle(color: Colors.black),
  //                   ),
  //                   TextSpan(
  //                     text: snapshot.email,
  //                     style: const TextStyle(color: Colors.deepPurple),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(
  //               top: 4.0,
  //               bottom: 4.0,
  //             ),
  //             child: RichText(
  //               text:  TextSpan(
  //                 children: <TextSpan>[
  //                   const TextSpan(
  //                     text: Strings.mobileNumber,
  //                     style: TextStyle(color: Colors.black),
  //                   ),
  //                   TextSpan(
  //                     text: snapshot.mobileNumber,
  //                     style: const TextStyle(color: Colors.deepPurple),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
