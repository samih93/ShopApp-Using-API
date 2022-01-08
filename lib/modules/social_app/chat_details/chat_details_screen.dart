import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/social_app/social_layout_controller.dart';
import 'package:udemy_flutter/models/social_app/social_usermodel.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel socialUserModel;

  ChatDetailsScreen({required this.socialUserModel});
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLayoutController>(
      init: Get.find<SocialLayoutController>(),
      builder: (socialLayoutController) => Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: socialUserModel!.image == null ||
                        socialUserModel!.image == ""
                    ? AssetImage('assets/default profile.png') as ImageProvider
                    : NetworkImage(socialUserModel!.image.toString()),
              ),
              SizedBox(
                width: 10,
              ),
              Text(socialUserModel!.name.toString()),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  child: Text('hello word'),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(10),
                      topStart: Radius.circular(10),
                      topEnd: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                  child: Text('hello word'),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: defaultColor.withOpacity(0.2),
                    borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(10),
                      topStart: Radius.circular(10),
                      topEnd: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: textController,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'type your message here ...'),
                      ),
                    ),
                    Container(
                      color: defaultColor,
                      width: 50,
                      child: MaterialButton(
                        onPressed: () {
                          socialLayoutController.sendMessage(
                              receiverId: socialUserModel.uId.toString(),
                              messageDate: DateTime.now().toString(),
                              text: textController.text);
                        },
                        minWidth: 1,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
