import 'dart:async';

import 'package:adminpanel/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splesh_screen extends StatefulWidget {
  const splesh_screen({Key? key}) : super(key: key);

  @override
  State<splesh_screen> createState() => _splesh_screenState();
}

class _splesh_screenState extends State<splesh_screen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () async {

     bool msg=await FireBaseHelper.fireBaseHelper.checkLogin();
      Get.offAndToNamed(msg?'/home':'/signin');
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/images/logo.png",height: 130),
        ),
      ),
    );
  }
}
