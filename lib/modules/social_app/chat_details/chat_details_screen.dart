import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/social_app/social_layout_controller.dart';
import 'package:udemy_flutter/models/social_app/social_usermodel.dart';
import 'package:udemy_flutter/modules/social_app/chat_details/chatdetailsController.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel socialUserModel;

  ChatDetailsScreen({required this.socialUserModel});
  var textController = TextEditingController();
  ChatDetailsController chatDetailsController =
      Get.put(ChatDetailsController());

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
                backgroundImage: socialUserModel.image == null ||
                        socialUserModel.image == ""
                    ? AssetImage('assets/default profile.png') as ImageProvider
                    : NetworkImage(socialUserModel.image.toString()),
              ),
              SizedBox(
                width: 10,
              ),
              Text(socialUserModel.name.toString()),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildMessage(),
              _buildMyMessage(),
              Spacer(),
              Container(
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textController,
                          onChanged: (value) {
                            chatDetailsController.ontypingmessage(value);
                          },
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'type your message here ...'),
                        ),
                      ),
                      chatDetailsController.messageText.value != ""
                          ? Container(
                              color: defaultColor,
                              width: 50,
                              child: MaterialButton(
                                onPressed: () {
                                  socialLayoutController.sendMessage(
                                      receiverId:
                                          socialUserModel.uId.toString(),
                                      messageDate: DateTime.now().toString(),
                                      text: textController.text);
                                  textController.text = "";
                                  chatDetailsController.ontypingmessage("");
                                },
                                minWidth: 1,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ))
                          : Container(
                              color: Colors.grey.shade400,
                              width: 50,
                              child: MaterialButton(
                                onPressed: () {},
                                minWidth: 1,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyMessage() => Align(
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
      );

  Widget _buildMessage() => Align(
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
      );
}
