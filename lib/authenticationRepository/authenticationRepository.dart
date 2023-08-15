import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:musicapp/authenticationRepository/exceptions/signup_email_password_failure.dart';
import 'package:musicapp/features/introduce.dart';
import 'package:musicapp/features/welcome/welcome3.dart';
import 'package:musicapp/views/home.dart';

class authenticationRepository extends GetxController {
  static authenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => IntroduceScreen())
        : Get.offAll(() => Home());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('ERROR', 'The provided phone number is not valid.');
          } else {
            Get.snackbar('ERROR', 'Somthing went Wrong. Try again.');
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOTP(String otp) async {
    var credetials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
          verificationId: this.verificationId.value, smsCode: otp),
    );
    return credetials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => Home())
          : Get.to(() => WelcomeThree());
    } on FirebaseAuthException catch (e) {
      final ex = signUpWidgetEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      var ex = signUpWidgetEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // ignore: unused_catch_clause
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
