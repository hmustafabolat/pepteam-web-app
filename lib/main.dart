import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_test/service/firebase_conf.dart';
import 'package:ss_test/view/dashboard_page.dart';
import 'package:ss_test/view/home.dart';
import 'package:ss_test/view/landing_page.dart';
import 'package:ss_test/view/login_screen.dart';
import 'package:ss_test/view/password_update_page.dart';
import 'package:ss_test/view/users_page.dart';
import 'bindings/start_app.dart';

final FirebaseConfigurations _firebaseConfigurations = FirebaseConfigurations();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: _firebaseConfigurations.apiKey,
          appId: _firebaseConfigurations.appId,
          messagingSenderId: _firebaseConfigurations.messagingSenderId,
          projectId: _firebaseConfigurations.projectId));

  StartApp.startBeforeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LandingPage(),
    );
  }
}


//flutter_staggered_grid_view