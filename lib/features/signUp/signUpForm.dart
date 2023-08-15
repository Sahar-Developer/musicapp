import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';
import 'package:musicapp/consts/images.dart';
import 'package:musicapp/controllers/signup_controller.dart';
import 'package:musicapp/features/forget/otp.dart';
import 'package:musicapp/features/login.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(signUpController());

    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Form(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              TextFormField(
                  controller: controller.fulname,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: "Full Name",
                      hintText: "Sahar Eyvazzade",
                      border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline_outlined),
                      labelText: "E-mail",
                      hintText: "xxxxx@gmail.com",
                      border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                  controller: controller.phoneNo,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_outlined),
                      labelText: "Phone No",
                      hintText: "+98900000000",
                      border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                  controller: controller.password,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: "Password",
                      hintText: "password123",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.remove_red_eye_sharp)))),
              SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        // if (key.currentState!.validate()) {
                        signUpController.instance.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim());
                        // signUpController.instance
                        //     .phoneAuthentication(controller.phoneNo.text.trim());
                        Get.to(() => OtpPage());
                        // }
                      },
                      child: Text("SIGNUP",
                          style: GoogleFonts.montserrat(
                              color: AppColor.dwhiteColor,
                              fontWeight: FontWeight.w700)))),
              SizedBox(height: 30),
              Text("OR"),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image(image: AssetImage(googleLogo), width: 20),
                      label: Text("Sign in with Google"))),
              SizedBox(height: 10),
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
            ])));
  }
}
