import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/view/dashboard_page.dart';
import 'package:ss_test/view/user_editing_page.dart';
import 'package:ss_test/viewModel/auth_viewModel.dart';

import '../constants/project_text_styles.dart';
import '../constants/text_field_input_decorations.dart';
import 'login_screen.dart';
import 'password_update_page.dart';
import 'users_page.dart';

class UserAddPage extends StatefulWidget {
  UserAddPage({super.key});

  @override
  State<UserAddPage> createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {
  final AuthViewModel _controller = Get.put(AuthViewModel());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
                key: _controller.signUpFormGlobalKey,
                child: Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kullanıcı Ekle',
                      style: ProjectTextStyles().darkBlue_w600_s24,
                    ),
                    SizedBox(height: 5),
                    Text(
                        'Lütfen eklemek istediğiniz kullanıcı bilgilerini girin.',
                        style: ProjectTextStyles().grey_w400_s14),
                    SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 25),
                    Text('Adı Soyadı'),
                    SizedBox(height: 5),
                    TextFormField(
                      // onSaved: (value) {
                      //   _viewModel.password = value;
                      // },
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecorators().FullNameInput,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 1
                          ? 'Ad, soyad giriniz'
                          : null,
                    ),
                    SizedBox(height: 20),
                    Text('Şifre'),
                    SizedBox(height: 5),
                    TextFormField(
                      // onSaved: (value) {
                      //   _viewModel.password = value;
                      // },
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecorators().PasswordInput,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 8
                          ? 'Minimum 8 karakter giriniz'
                          : null,
                    ),
                    SizedBox(height: 5),
                    Text('Şifre 8 karakterden uzun olmalıdır.',
                        style: ProjectTextStyles().grey_w400_s14),
                    SizedBox(height: 20),
                    Text('Mail Adresi'),
                    SizedBox(height: 5),
                    TextFormField(
                      // onSaved: (value) {
                      //   _viewModel.password = value;
                      // },
                      controller: _emailController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecorators().EmailInput,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Geçerli bir email giriniz'
                              : null,
                    ),
                    SizedBox(height: 45),
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'İptal',
                                  style: ProjectTextStyles().darkGrey_w500_s14,
                                )),
                            SizedBox(width: 10),
                            ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                  _controller.signUp(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                    _nameController.text.trim(),
                                  );
                                },
                                child: Text('Kullanıcı Ekle'))
                          ]),
                    )
                  ],
                ))
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
//             Get.to(DashboardPage());
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
//         SizedBox(
//           height: 25,
//         ),
//         TextButton(
//             onPressed: () {
//               Get.to(PasswordUpdate());
//             },
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
//               child: Text("Users Page",style: TextStyle(color: Colors.grey[600])),
//             )),
//       ],
//     );
//   }
// }
