import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height / 5.5,
                width: double.infinity,
                color: AppColor.lbgDarkColor,
                child: Column(
                  children: [
                    Text(
                      'Send us your Feedback!',
                      style: GoogleFonts.montserrat(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                          'Do you have a suggestion or found some bug?\nlet us know in the field below.',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
              Text("How was your experiance?",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: EmojiFeedback(
                  animDuration: const Duration(milliseconds: 300),
                  curve: Curves.bounceOut,
                  inactiveElementScale: .6,
                  inactiveElementBlendColor: AppColor.lbgDarkColor,
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              Container(
                  color: AppColor.lbgDarkColor,
                  width: double.infinity,
                  height: size.height / 4,
                  child: TextField(
                      decoration: InputDecoration(
                          fillColor: AppColor.lbgDarkColor,
                          filled: true,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Describe your experience here...'),
                      onTap: () {})),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: size.height / 10),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => FeedbackPage());
                        },
                        child: Text(
                          'Send Feedback',
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: AppColor.dwhiteColor,
                              fontWeight: FontWeight.w800),
                        ))),
              )
            ],
          ),
        ));
  }
}
