import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/view/add_user_page.dart';
import 'package:ss_test/view/dashboard_page.dart';
import 'package:ss_test/view/password_update_page.dart';
import 'package:ss_test/view/user_editing_page.dart';
import 'package:ss_test/view/user_list_page.dart';
import 'package:ss_test/view/users_page.dart';
import 'package:ss_test/viewModel/auth_viewModel.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  var _selectedPage = Rxn<Widget>();

  @override
  void dispose() {
    _selectedPage.close(); // Rxn değişkeni kapatılır
    super.dispose();
  }

  Widget? _buildSelectedPage() {
    if (_selectedPage.value != null) {
      return _selectedPage.value!;
    } else {
      _selectedPage.value = UserListPage();
      return _selectedPage.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: ProjectPaddings().only_lTR_125_50_125,
        child: Row(
          children: [
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    _selectedPage.value = UserEditingPage();
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
                    child: Text("Edit User",
                        style: TextStyle(color: Colors.grey[600])),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      _selectedPage.value = UserAddPage();
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
                      child: Text("Add User",
                          style: TextStyle(color: Colors.grey[600])),
                    )),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      _selectedPage.value = UserListPage();
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 45),
                      child: Text("User List",
                          style: TextStyle(color: Colors.grey[600])),
                    )),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      _selectedPage.value = PasswordUpdate();
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 17),
                      child: Text("Update Password",
                          style: TextStyle(color: Colors.grey[600])),
                    )),
              ],
            ),
            SizedBox(width: 100),
            Expanded(
              child: Obx(() => _buildSelectedPage()!),
            ),

          ],
        ),
      ),
    );
  }
}
