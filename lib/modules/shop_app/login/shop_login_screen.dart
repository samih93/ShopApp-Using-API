import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/shop_app/login/shoplogin_controller.dart';
import 'package:udemy_flutter/modules/shop_app/register/register_screen.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/network/local/cashhelper.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopLoginController>(
      init: ShopLoginController(),
      builder: (shopLoginController) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LOGIN",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Login Now to browse our hot offers",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultTextFormField(
                      controller: emailController,
                      text: "Email Address",
                      prefixIcon: Icon(Icons.email_outlined),
                      inputtype: TextInputType.emailAddress,
                      onvalidate: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter your email address';
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextFormField(
                      controller: passwordController,
                      text: "Password",
                      prefixIcon: Icon(Icons.lock),
                      inputtype: TextInputType.emailAddress,
                      onvalidate: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter password';
                        }
                      },
                      obscure: shopLoginController.showpassword,
                      suffixIcon: IconButton(
                        icon: shopLoginController.showpassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          shopLoginController.onObscurePassword();
                          print(shopLoginController.showpassword);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    shopLoginController.isloadingLogin
                        ? Center(child: CircularProgressIndicator())
                        : defaultButton(
                            text: "Login",
                            isUppercase: true,
                            onpress: () async {
                              ShopLoginModel? shopLoginModel;
                              if (_formkey.currentState!.validate()) {
                                shopLoginController
                                    .userlogin(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  shopLoginModel = value;
                                  if (shopLoginModel!.status!) {
                                    print("success");
                                    print(shopLoginModel!.userData!.token);
                                    CashHelper.saveData(
                                            key: "token",
                                            value: shopLoginModel!.userData!.token)
                                        .then((value) {
                                          token = shopLoginModel!.userData!.token.toString();
                                      showToast(
                                          message: shopLoginModel!.message,
                                          status: ToastStatus.Success);
                                      Get.off(ShopLayout());
                                    });
                                  } else {
                                    print("failed");
                                    showToast(
                                        message: shopLoginModel!.message,
                                        status: ToastStatus.Error);
                                  }
                                });
                              }
                            }),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                        ),
                        defaultTextButton(
                            onpress: () {
                              Get.to(RegisterScreen());
                            },
                            text: "Register".toUpperCase()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
