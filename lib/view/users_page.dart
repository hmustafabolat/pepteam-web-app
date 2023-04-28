import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/model/user_model.dart';
import 'package:ss_test/view/add_user_page.dart';
import 'package:ss_test/view/user_editing_page.dart';
import 'package:ss_test/viewModel/dashboard_viewModel.dart';

import '../constants/project_text_styles.dart';
import '../constants/text_field_input_decorations.dart';
import 'password_update_page.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final DashboardViewModel controller = Get.put(DashboardViewModel());
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
          ElevatedButton(onPressed: () {}, child: Text("")),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                SvgImage().settingsIcon,
                color: Colors.white,
              )),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundImage: NetImage().userImage,
              radius: 25,
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
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Dashboard"),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(UserAddPage());
                  },
                  child: Text("Add User")),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(UserEditingPage());
                  },
                  child: Text("Edit User")),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(PasswordUpdate());
                  },
                  child: Text("Update Password")),
            ],
          ),
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
                //Table Oluşturulacak.
                //Yeni kullanıcı ekleme butonu oluşturulacak.
                //Roller verilecek.
                ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Get.to(UserAddPage);
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

                          StreamBuilder<List<User>>(
                            stream: controller.userModelStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }

                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              List<User> users = snapshot.data!;

                              return Expanded(
                                child:  ListView.builder(
                                  itemCount: users.length,
                                  itemBuilder: (context, index) {
                                    String? userName = users[index].name;
                                    String? userEmail = users[index].email;
                                    String? userRole = users[index].isAdmin.toString();

                                    return ListTile(
                                      title: Text(userName),
                                      subtitle: Text(userEmail),
                                      trailing: Text(userRole),
                                    );
                                  },
                                )
                              );
                            },
                          ),
                          //   ListView.builder(
                          //   itemCount: users.length,
                          //   itemBuilder: (context, index) {
                          //     String? userName = users[index].name;
                          //     String? userEmail = users[index].email;
                          //     String? userRole = users[index].isAdmin.toString();
                          //
                          //     return ListTile(
                          //       title: Text(userName!),
                          //       subtitle: Text(userEmail!),
                          //       trailing: Text(userRole),
                          //     );
                          //   },
                          // );
                          // Column(
                          //   children: [
                          //     Row(
                          //       children: [
                          //         CircleAvatar(
                          //           backgroundImage: NetImage().userImage,
                          //           radius: 15,
                          //         ),
                          //         Padding(
                          //           padding: EdgeInsets.only(left: 8.0),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Text(
                          //                 "Kullanıcı Adı",
                          //                 style: ProjectTextStyles()
                          //                     .white_w500_s15,
                          //               ),
                          //               Text(
                          //                 "Kullanıcı Email",
                          //                 style:
                          //                     ProjectTextStyles().grey_w400_s12,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //         Spacer(),
                          //         Text(
                          //           "Admin",
                          //           style: ProjectTextStyles().grey_w400_s14,
                          //         ),
                          //         SizedBox(
                          //           width: 100,
                          //         ),
                          //         Text(
                          //           "Delete",
                          //           style: ProjectTextStyles().grey_w500_s14,
                          //         ),
                          //         SizedBox(
                          //           width: 30,
                          //         ),
                          //         TextButton(
                          //             onPressed: () {
                          //               Get.to(UserEditingPage());
                          //             },
                          //             child: Text(
                          //               "Edit",
                          //               style: ProjectTextStyles()
                          //                   .customPurple_w400_s14,
                          //             ))
                          //       ],
                          //     )
                          //   ],
                          // )
                        ],
                      ),
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
