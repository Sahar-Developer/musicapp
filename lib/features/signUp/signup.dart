import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';
import 'package:musicapp/consts/images.dart';
import 'package:musicapp/features/signUp/signUpForm.dart';

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
              SignUpForm()
            ],
          ),
        )),
      ),
    ));
  }
}
