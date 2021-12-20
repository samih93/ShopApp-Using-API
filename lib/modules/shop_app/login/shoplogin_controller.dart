import 'package:get/get.dart';
import 'package:udemy_flutter/shared/network/end_point.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper_shop.dart';

class ShopLoginController extends GetxController {
  bool _showpassword = true;
  bool get showpassword => _showpassword;

  bool _isloadingLogin = false;
  bool get isloadingLogin => _isloadingLogin;

  onObscurePassword() {
    _showpassword = !showpassword;
    update();
  }

  void userlogin({required String email, required String password}) {
    _isloadingLogin = true;
    update();
    print("first:" + _isloadingLogin.toString());
    DioHelperShop.postData(
        url: LOGIN, data: {"email": email, "password": password}).then((value) {
      print(value);
      _isloadingLogin = false;
      print("last:" + _isloadingLogin.toString());

      update();
    }).catchError((error) {
      print(error.toString());
    });
  }
}
