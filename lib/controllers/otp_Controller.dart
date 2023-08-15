import 'package:get/get.dart';
import 'package:musicapp/authenticationRepository/authenticationRepository.dart';
import 'package:musicapp/views/home.dart';

class otpController extends GetxController {
  static otpController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await authenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(Home()) : Get.back();
  }
}
