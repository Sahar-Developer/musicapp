import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:musicapp/features/welcome/welcome1.dart';
import 'package:musicapp/features/welcome/welcome2.dart';
import 'package:musicapp/features/welcome/welcome3.dart';

class IntroduceController extends GetxController {
  RxInt currentPage = 0.obs;

  final controller = LiquidController();
  final pages = [
    WelcomeOne(),
    WelcomeTwo(),
    WelcomeThree(),
  ];

  onPageChangeCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;

  skip() => controller.jumpToPage(page: 2);
  RxBool animate = false.obs;
}
