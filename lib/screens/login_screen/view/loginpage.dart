import 'package:adminpanel/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.blueGrey.shade100,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Image.asset("assets/images/logo.png", height: 80),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Log in",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold
                      // letterSpacing: 1,
                      ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: txtemail,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey.shade700)),
                              // hintText: "xyz@gmail.com",
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Email",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade700)),
                              ),
                              prefixIcon: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.orange.shade100,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Icon(Icons.email,
                                    size: 25,
                                    color: Colors.deepOrange.shade300),
                              )),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextField(
                            controller: txtpassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                label: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Password",
                                      style: TextStyle(
                                          color: Colors.blueGrey.shade700)),
                                ),
                                // hintText: "Enter password",
                                prefixIcon: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.orange.shade100,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Icon(Icons.lock,
                                      size: 25,
                                      color: Colors.deepOrange.shade300),
                                ))),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text("Forgot password?")),
                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                            onTap: () async {
                              String? msg = await FireBaseHelper.fireBaseHelper
                                  .signIn(
                                      email: txtemail.text,
                                      password: txtpassword.text);
                              Get.snackbar(
                                  msg == "Success" ? "success" : "Fail to login",
                                  "firebase app");
                              if (msg == "Success") {
                                Get.offAndToNamed("/home");
                              }
                            },
                            child: Container(
                                height: 60,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.orange.shade500,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    )))),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("---------------------"),
                            SizedBox(
                              width: 2,
                            ),
                            Text("Or"),
                            SizedBox(
                              width: 2,
                            ),
                            Text("---------------------"),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),boxShadow: [BoxShadow(blurStyle: BlurStyle.inner,color: Colors.white)]),
                              height: 50,
                              width: 50,
                              child: FlutterLogo(),
                            ),
                            SizedBox(width: 20,),
                            InkWell(
                              onTap: () async {

                                String? msg = await FireBaseHelper.fireBaseHelper
                                    .googleSignIn();
                                Get.snackbar(
                                    msg == "Success" ? "success" : "Fail to login",
                                    "firebase app");
                                if (msg == "Success") {
                                  Get.offNamed("/home");
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),boxShadow: [BoxShadow(blurStyle: BlurStyle.inner,color: Colors.white)]),
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/images/google.png"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",style: TextStyle(fontSize: 15)),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('/Singup');
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold,fontSize: 16),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
