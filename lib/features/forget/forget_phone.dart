import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';
import 'package:musicapp/consts/images.dart';
import 'package:musicapp/features/formHeaderwidget.dart';

class ForgetPassPhoneScreen extends StatelessWidget {
  const ForgetPassPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(height: 100),
                FormHeaderWidget(
                  image: forget,
                  title: "Forget Password",
                  subTitle:
                      "Please insert your phone number in order to get verification.",
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 40.0,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text("Phone"),
                          hintText: "+9800000000",
                          prefixIcon: Icon(Icons.mail_outline_outlined)),
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "NEXT",
                              style: GoogleFonts.montserrat(
                                  color: AppColor.dwhiteColor,
                                  fontWeight: FontWeight.w700),
                            )))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
