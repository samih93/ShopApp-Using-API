import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_layout.dart';
import 'package:udemy_flutter/layout/shop_layout_controller.dart';
import 'package:udemy_flutter/models/login_model.dart';
import 'package:udemy_flutter/modules/register/shop_register_screen.dart';

import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/network/local/cashhelper.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopLayoutController>(
      init: Get.find<ShopLayoutController>(),
      builder: (shopLayoutController) => Scaffold(
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
                      obscure: shopLayoutController.showpassword,
                      suffixIcon: IconButton(
                        icon: shopLayoutController.showpassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          shopLayoutController.onObscurePassword();
                          print(shopLayoutController.showpassword);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    shopLayoutController.isloadingLogin
                        ? Center(child: CircularProgressIndicator())
                        : defaultButton(
                            text: "Login",
                            isUppercase: true,
                            onpress: () async {
                              ShopLoginModel? shopLoginModel;
                              if (_formkey.currentState!.validate()) {
                                shopLayoutController
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
                                            value:
                                                shopLoginModel!.userData!.token)
                                        .then((value) {
                                      token = shopLoginModel!.userData!.token
                                          .toString();
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
                              Get.to(ShopRegisterScreen());
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
