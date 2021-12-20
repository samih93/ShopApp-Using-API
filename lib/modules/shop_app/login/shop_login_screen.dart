import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/modules/shop_app/login/shoplogin_controller.dart';
import 'package:udemy_flutter/modules/shop_app/register/register_screen.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopLoginController>(
      init: ShopLoginController(),
      builder: (shopLoginController) => Center(
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
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
                            onpress: () {
                              if (_formkey.currentState!.validate()) {
                                shopLoginController.userlogin(
                                    email: emailController.text,
                                    password: passwordController.text);
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
