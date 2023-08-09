import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';
import 'package:musicapp/consts/images.dart';
import 'package:musicapp/features/forget/forget.dart';
import 'package:musicapp/features/formHeaderwidget.dart';
import 'package:musicapp/features/signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange, Colors.yellow.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              FormHeaderWidget(
                  image: login,
                  title: "Welcome Back!",
                  subTitle: "Life's short,Let's Enjoy it."),
              Form(
                  child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "E-mail",
                        hintText: "xxxxx@gmail.com",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "Password",
                        hintText: "password123",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.remove_red_eye_sharp)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          ForgetPasswordSheet.buildShowModelBottonSheet(
                              context);
                        },
                        child: Text("Forget Password?")),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.montserrat(
                                  color: AppColor.dwhiteColor,
                                  fontWeight: FontWeight.w700),
                            ))),
                    SizedBox(
                      height: 30,
                    ),
                    Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Image(
                            image: AssetImage(googleLogo),
                            width: 20,
                          ),
                          label: Text("Sign in with Google")),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => SignupPage());
                        },
                        child: Text.rich(TextSpan(
                            text: "Don't have an Account?",
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                  text: "Signup",
                                  style: TextStyle(color: Colors.blue))
                            ])))
                  ],
                ),
              ))
            ],
          ),
        )),
      ),
    ));
  }
}
