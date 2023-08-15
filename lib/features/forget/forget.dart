import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/features/forget/forgetBTNwidget.dart';
import 'package:musicapp/features/forget/forget_mail.dart';
import 'package:musicapp/features/forget/forget_phone.dart';

class ForgetPasswordSheet {
  static Future<dynamic> buildShowModelBottonSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        builder: (context) => Container(
            padding: EdgeInsets.all(30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Make Selection!",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Select one of the options given below to reset your password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 30),
              ForgetPasswordBTNsheet(
                  btnIcon: Icons.mail_outline_outlined,
                  title: "E-Mail",
                  subTitle: "Reset via Mail verification.",
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(() => ForgetPassMailScreen());
                  }),
              SizedBox(height: 5),
              ForgetPasswordBTNsheet(
                  btnIcon: Icons.mobile_friendly_outlined,
                  title: "Phone No",
                  subTitle: "Reset via Phone verification.",
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(() => ForgetPassPhoneScreen());
                  })
            ])));
  }
}
