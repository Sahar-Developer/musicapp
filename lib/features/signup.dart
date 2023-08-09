import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';
import 'package:musicapp/consts/images.dart';
import 'package:musicapp/features/login.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColor.dbgDarkColor, Colors.greenAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image(
                image: AssetImage(sign),
                height: size.height * 0.3,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Welcome To the MUSIC World!",
                style: GoogleFonts.montserrat(
                    fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Text(
                "Life's short,Let's Enjoy it.",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Form(
                  child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "Full Name",
                        // labelStyle: TextStyle(color: Colors.white),
                        hintText: "Sahar Eyvazzade",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline_outlined),
                        labelText: "E-mail",
                        // labelStyle: TextStyle(color: Colors.white),
                        hintText: "xxxxx@gmail.com",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_outlined),
                        labelText: "Phone No",
                        // labelStyle: TextStyle(color: Colors.white),
                        hintText: "+98900000000",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "Password",
                        hintText: "password123",
                        // labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.remove_red_eye_sharp)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "SIGNUP",
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
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => LoginPage());
                        },
                        child: Text.rich(TextSpan(
                            text: "Already have an Account?",
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600))
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
