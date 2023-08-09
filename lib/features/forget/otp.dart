import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 90, horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("CO\nDE",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800, fontSize: 90)),
                Text("Verificaion".toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Enter the verification code sent on sahareyvazzedeh80@gmail.com",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.3),
                  filled: true,
                  keyboardType: TextInputType.number,
                  clearText: true,
                  cursorColor: AppColor.dslideColor,
                  disabledBorderColor: AppColor.lwhiteColor,
                  focusedBorderColor: AppColor.dslideColor,
                  onSubmit: (code) {
                    print("OTP is => $code");
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "NEXT",
                          style: GoogleFonts.montserrat(
                              color: AppColor.dwhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
