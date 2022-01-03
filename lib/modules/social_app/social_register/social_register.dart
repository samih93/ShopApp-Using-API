import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/layout/social_app/social_layout.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/social_app/social_login/social_login_controller.dart';
import 'package:udemy_flutter/modules/social_app/social_register/social_register_controller.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/network/local/cashhelper.dart';

class SocialRegisterScreen extends StatelessWidget {
  var _formkey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<SocialRegisterController>(
        init: SocialRegisterController(),
        builder: (socialRegisterController) => Center(
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
                      "REGISTER",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "REGITER To Comunicate with friends",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultTextFormField(
                      controller: nameController,
                      text: "User Name",
                      prefixIcon: Icon(Icons.person),
                      inputtype: TextInputType.name,
                      onvalidate: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter your User Name';
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
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
                      obscure: socialRegisterController.showpassword,
                      suffixIcon: IconButton(
                        icon: socialRegisterController.showpassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          socialRegisterController.onObscurePassword();
                          print(socialRegisterController.showpassword);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextFormField(
                      controller: phoneController,
                      text: "Phone Number",
                      prefixIcon: Icon(Icons.phone),
                      inputtype: TextInputType.phone,
                      onvalidate: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter your Phone Number';
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    socialRegisterController.isloadingRegister!
                        ? Center(child: CircularProgressIndicator())
                        : defaultButton(
                            text: "REGITSER",
                            isUppercase: true,
                            onpress: () async {
                              // NOTE : GET STATUS OF  register method
                              String registerMessage = "";
                              if (_formkey.currentState!.validate()) {
                                await socialRegisterController.registerUser(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text);
                              }
                              print(
                                  "status firestore ${socialRegisterController.isSuccessRegisterToFireStore}");
                              if (socialRegisterController
                                  .isSuccessRegisterToFireStore) {
                                Get.offAll(SocialLayout());
                              }
                              if (socialRegisterController.statusLoginMessage ==
                                  ToastStatus.Success) {
                                //NOTE: uId saved in login method
                                CashHelper.saveData(key: "uId", value: uId);
                                Get.offAll(SocialLayout());
                              }
                              showToast(
                                  message:
                                      socialRegisterController.statusMessage,
                                  status: socialRegisterController
                                      .statusLoginMessage!);
                            }),
                    SizedBox(
                      height: 10,
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
