import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/social_app/social_layout_controller.dart';
import 'package:udemy_flutter/models/social_app/social_usermodel.dart';
import 'package:udemy_flutter/modules/social_app/chat_details/chat_details_screen.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class SocialChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLayoutController>(
      init: Get.find<SocialLayoutController>(),
      builder: (socialLayoutController) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildChatItem(socialLayoutController.users[index]),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: socialLayoutController.users.length),
    );
  }

  Widget buildChatItem(
    SocialUserModel socialUserModel,
  ) =>
      InkWell(
        onTap: () {
          // TODO: get Messages
          // socialLayoutController.getMessages(
          //     receiverId: socialUserModel.uId.toString());
          Get.to(ChatDetailsScreen(
            socialUserModel: socialUserModel,
          ));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: socialUserModel.image == null ||
                        socialUserModel.image == ""
                    ? AssetImage('assets/default profile.png') as ImageProvider
                    : NetworkImage(socialUserModel.image!),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        socialUserModel.name.toString(),
                        style: TextStyle(height: 1.4),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      );
}
