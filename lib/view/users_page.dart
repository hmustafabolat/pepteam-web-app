import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/view/add_user_page.dart';
import 'package:ss_test/view/dashboard_page.dart';
import 'package:ss_test/view/user_editing_page.dart';
import 'package:ss_test/viewModel/dashboard_viewModel.dart';
import 'package:ss_test/model/user_model.dart';

import '../constants/project_text_styles.dart';
import '../constants/text_field_input_decorations.dart';
import '../viewModel/auth_viewModel.dart';
import 'login_screen.dart';
import 'password_update_page.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final DashboardViewModel controller = Get.put(DashboardViewModel());

  void goToAddUserPage() {
    Get.to(UserAddPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(PngImage().contentIcon),
            SizedBox(width: 10),
            SvgPicture.asset(
              SvgImage().untitledUiText,
              color: Colors.white,
            ),
            SizedBox(width: 30),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(UserEditingPage());
              },
              icon: SvgPicture.asset(
                SvgImage().settingsIcon,
                color: Colors.white,
              )),
          CircleAvatar(
            child: IconButton(
              onPressed: () async {
                final AuthViewModel _viewModel = Get.find();
                await _viewModel.signOut();
                Get.to(LoginScreen());
              },
              icon: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: _addUserWidget(),
    );
  }

  Padding _addUserWidget() {
    return Padding(
      padding: ProjectPaddings().only_lTR_125_50_125,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RouteButtons(),
          SizedBox(width: 110),
          Expanded(
            child: Column(
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
                      goToAddUserPage();
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
                                SizedBox(
                                  width: 40,
                                ),
                                Text("Name"),
                                SizedBox(
                                  width: 780,
                                ),
                                Text("Role")
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            FutureBuilder(
                              future: Future.delayed(Duration.zero, () async {
                                return controller.users;
                              }),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List> snapshot) {
                                if (snapshot.hasData) {
                                  return Expanded(
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                              snapshot.data![index]['name']),
                                          subtitle: Text(
                                              snapshot.data![index]['email']),
                                          trailing: Text(snapshot.data![index]
                                                  ['isAdmin']
                                              .toString()),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RouteButtons extends StatelessWidget {
  const RouteButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.to(DashboardPage());
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
            child: Text("Dashboard"),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(UserAddPage());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
              child: Text("Add User"),
            )),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(UserEditingPage());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
              child: Text("Edit User"),
            )),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(PasswordUpdate());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 17),
              child: Text("Update Password"),
            )),
      ],
    );
  }
}
