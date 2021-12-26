import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/network/local/cashhelper.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class UpdateProfile extends StatelessWidget {
  var _formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopLayoutController>(
        init: Get.find<ShopLayoutController>(),
        builder: (shopLayoutController) {
          if(shopLayoutController.shopLoginModel!=null)
            {
              nameController.text = shopLayoutController.shopLoginModel?.userData!=null? shopLayoutController.shopLoginModel!.userData!.name.toString():"";
              emailController.text =shopLayoutController.shopLoginModel?.userData!=null? shopLayoutController.shopLoginModel!.userData!.email.toString():"";
              phoneController.text = shopLayoutController.shopLoginModel?.userData!=null? shopLayoutController.shopLoginModel!.userData!.phone.toString():"";

            }

          return  Scaffold(
            appBar: AppBar(
              title: Text("Update Profile"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Form(
                  key :_formkey,
                  child: Column(
                    children: [

                      defaultTextFormField(
                        controller: nameController,
                        text: "User Name",
                        prefixIcon: Icon(Icons.person),
                        inputtype: TextInputType.name,
                        onvalidate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Name';
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
                        controller: phoneController,
                        text: "Phone Number",
                        prefixIcon: Icon(Icons.phone),
                        inputtype: TextInputType.phone,
                        onvalidate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Phone number';
                          }
                        },

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      shopLayoutController.isloadingupdate!
                          ? Center(child: CircularProgressIndicator())
                          : defaultButton(
                          text: "Update",
                          isUppercase: true,
                          onpress: () async {
                            ShopLoginModel? shopLoginModel;

                            if (_formkey.currentState!.validate()) {
                              shopLayoutController
                                  .updateUserData(name:nameController.text,email:emailController.text ,phone :phoneController.text)
                                  .then((value) {
                                 shopLoginModel = value;

                                if (shopLoginModel!.status!) {
                                  print("success");
                                  print(shopLoginModel!.userData!.token);
                                    showToast(
                                        message: shopLoginModel!.message,
                                        status: ToastStatus.Success);
                                } else {
                                  print("failed");
                                  showToast(
                                      message:shopLoginModel!.message,
                                      status: ToastStatus.Error);
                                }
                              });
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
