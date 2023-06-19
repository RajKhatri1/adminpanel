import 'package:adminpanel/screens/homescreen/view/homescreen.dart';
import 'package:adminpanel/screens/input/view/input_screen.dart';
import 'package:adminpanel/screens/login_screen/view/loginpage.dart';
import 'package:adminpanel/screens/signupscreen/signUp_screen.dart';
import 'package:adminpanel/screens/spleshscreen/view/Splesh_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splesh',
        getPages: [
          GetPage(name: '/', page: () => SignInScreen(),),
          GetPage(name: '/signin', page: () => SignInScreen(),),
          GetPage(name: '/Singup', page: () => SignupScreen(),),
          GetPage(name: '/input', page: () => InputScreen(),),
          GetPage(name: '/home', page: () => HomeScreen(),),
          GetPage(name: '/splesh', page: () => splesh_screen(),),
        ],
      ),
    ),
  );
}
