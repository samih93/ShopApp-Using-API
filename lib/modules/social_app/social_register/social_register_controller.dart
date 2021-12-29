import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SocialRegisterController extends GetxController {
  //NOTE : ---------------------Show Hide password--------------------
  bool _showpassword = true;
  bool get showpassword => _showpassword;

  onObscurePassword() {
    _showpassword = !showpassword;
    update();
  }

  // NOTE: --------------------- Resgister New User --------------

  bool? _isloadingRegister = false;
  bool? get isloadingRegister => _isloadingRegister;

  Future<void> registerUser(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    _isloadingRegister = true;
    update();
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      _isloadingRegister = false;

      print(value.user!.email);
      print(value.user!.uid);
      update();
    }).catchError((error) {
      print(error.toString());
    });
  }
}
