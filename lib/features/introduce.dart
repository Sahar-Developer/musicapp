import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:musicapp/consts/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/introduceController.dart';

class IntroduceScreen extends StatelessWidget {
  IntroduceScreen({Key? key}) : super(key: key);

  final controllert = Get.put(IntroduceController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            LiquidSwipe(
              pages: controllert.pages,
              liquidController: controllert.controller,
              onPageChangeCallback: controllert.onPageChangeCallback,
              slideIconWidget: Icon(
                Icons.arrow_back_ios,
                // color: AppColor.dwhiteColor,
              ),
            ),
            Positioned(
                right: 10,
                top: 10,
                child: TextButton(
                  onPressed: () => controllert.skip(),
                  child: Text(
                    "Skip",
                    style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                )),
            Positioned(
                bottom: 30,
                left: 170,
                child: AnimatedSmoothIndicator(
                    effect: WormEffect(
                        activeDotColor: AppColor.dbgDarkColor,
                        dotColor: AppColor.dslideColor,
                        dotHeight: 7.0),
                    activeIndex: controllert.currentPage.value,
                    count: 3))
          ],
        ),
      ),
    );
  }
}
