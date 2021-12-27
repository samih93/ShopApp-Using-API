import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SocialLoginController extends GetxController {
  bool _showpassword = true;
  bool get showpassword => _showpassword;

  bool _isloadingLogin = false;
  bool get isloadingLogin => _isloadingLogin;

  onObscurePassword() {
    _showpassword = !showpassword;
    update();
  }

  Future<void> userlogin(
      {required String email, required String password}) async {
    _isloadingLogin = true;
    update();
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      _isloadingLogin = false;

      print(value.user!.email);
      print(value.user!.uid);
      update();
    }).catchError((error) {
      _isloadingLogin = false;

      update();

      print(error.toString());
    });
  }
}
