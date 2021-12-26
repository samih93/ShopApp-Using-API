import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/network/local/cashhelper.dart';

class ShopRegisterScreen extends StatelessWidget {
  var _formkey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ShopLayoutController>(
        init: Get.find<ShopLayoutController>(),
        builder: (shopLayoutController) => Center(
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
                      "REGITER Now to browse our hot offers",
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
                    shopLayoutController.isloadingRegister!
                        ? Center(child: CircularProgressIndicator())
                        : defaultButton(
                            text: "REGITSER",
                            isUppercase: true,
                            onpress: () async {
                              ShopLoginModel? shopLoginModel;
                              if (_formkey.currentState!.validate()) {
                                shopLayoutController
                                    .registerUser(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text)
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
