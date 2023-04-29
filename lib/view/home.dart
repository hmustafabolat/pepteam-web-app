// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:ss_test/constants/project_images.dart';
// import 'package:ss_test/view/dashboard_page.dart';
// import 'package:ss_test/view/user_editing_page.dart';
// import 'package:ss_test/view/users_page.dart';
// import 'package:ss_test/viewModel/auth_viewModel.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   var _selectedPage = Rxn<Widget>();
//
//   @override
//   void dispose() {
//     _selectedPage.close(); // Rxn değişkeni kapatılır
//     super.dispose();
//   }
//
//   Widget _buildSelectedPage() {
//     if (_selectedPage.value != null) {
//       return _selectedPage.value!;
//     } else {
//       return Container();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Image.asset(PngImage().contentIcon),
//             SizedBox(width: 10),
//             SvgPicture.asset(
//               SvgImage().untitledUiText,
//               color: Colors.white,
//             ),
//             SizedBox(width: 30),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   _selectedPage.value = DashboardPage();
//                 },
//                 child: Text("Dashboard"),
//                 style: ElevatedButton.styleFrom(),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   _selectedPage.value = UsersPage();
//                 },
//                 child: Text("Users"),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.to(UserEditingPage());
//             },
//             icon: SvgPicture.asset(
//               SvgImage().settingsIcon,
//               color: Colors.white,
//             ),
//           ),
//           CircleAvatar(
//             child: IconButton(
//               onPressed: () async {
//                 print("#1");
//                 final AuthViewModel _viewModel = Get.find();
//                 await _viewModel.signOut();
//                 print("#2");
//               },
//               icon: Icon(Icons.person),
//             ),
//           ),
//         ],
//       ),
//       body: Obx(() => _buildSelectedPage()),
//     );
//   }
// }
