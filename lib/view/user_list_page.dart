import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/constants/project_text_styles.dart';
import 'package:ss_test/view/add_user_page.dart';
import 'package:ss_test/view/dashboard_page.dart';
import 'package:ss_test/view/user_editing_page.dart';
import 'package:ss_test/viewModel/dashboard_viewModel.dart';
import 'password_update_page.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final DashboardViewModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kullanıcılar',
            style: ProjectTextStyles().darkBlue_w600_s24,
          ),
          SizedBox(height: 5),
          Text('Sensör Kullanıcıları',
              style: ProjectTextStyles().grey_w400_s14),
          SizedBox(height: 20),
          Container(
            height: 1,
            color: Colors.grey[300],
          ),
          SizedBox(height: 25),
          ElevatedButton.icon(
              style:
              ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              label: Text(
                "Yeni Kullanıcı Ekle",
                style: ProjectTextStyles().black_w400_s13,
              )),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 1,
            color: Colors.grey[300],
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              height: 600,
              width: 1560,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                border: Border.all(width: 2, color: Colors.grey.shade400),
                color: Colors.white,
              ),
              child: Padding(
                padding: ProjectPaddings().only_lTR_50_50_50,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Name"),
                          // SizedBox(
                          //   width: 780,
                          // ),
                          Spacer(),
                          Text("Role"),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),

                      GetX<DashboardViewModel>(
                        builder: (controller) {
                          if (controller.users.isEmpty) {
                            return Center(child: CircularProgressIndicator());
                          }

                          return Expanded(child: ListView.builder(
                            itemCount: controller.users.length,
                            itemBuilder: (context, index) {

                              final user = controller.users[index];
                              var _role = user['isAdmin'];

                              if(_role == true){
                                _role = 'Admin';
                              }
                              else{
                                _role = 'Read-only';
                              }
                              return ListTile(
                                title: Text(user['name']),
                                subtitle: Text(user['email']),
                                trailing: Text(_role),
                              );
                            },
                          ));
                        },
                      ),
                    ]),
              ),
            ),
          ),
        ],
    );
  }
}

// class RouteButtons extends StatelessWidget {
//   const RouteButtons({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextButton(
//           onPressed: () {
//             Get.to(() => DashboardPage());
//           },
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
//             child: Text("Dashboard",style: TextStyle(color: Colors.grey[600])),
//           ),
//         ),
//         SizedBox(
//           height: 25,
//         ),
//         TextButton(
//             onPressed: () {
//               Get.to(UserAddPage());
//             },
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
//               child: Text("Add User",style: TextStyle(color: Colors.grey[600])),
//             )),
//         SizedBox(
//           height: 25,
//         ),
//         TextButton(
//             onPressed: () {
//               Get.to(UserEditingPage());
//             },
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
//               child: Text("Edit User",style: TextStyle(color: Colors.grey[600])),
//             )),
//         SizedBox(
//           height: 25,
//         ),
//         TextButton(
//             onPressed: () {
//               Get.to(PasswordUpdate());
//             },
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 17),
//               child: Text("Update Password",style: TextStyle(color: Colors.grey[600])),
//             )),
//       ],
//     );
//   }
// }