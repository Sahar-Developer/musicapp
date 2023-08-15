import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:musicapp/authenticationRepository/authenticationRepository.dart';

class signUpController extends GetxController {
  static signUpController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fulname = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {
    authenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  void phoneAuthentication(String phoneNo) {
    authenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
