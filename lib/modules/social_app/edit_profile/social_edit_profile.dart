import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/social_app/social_layout_controller.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class SocialEditProfile extends StatelessWidget {
  final double coverheight = 250;
  double profileheight = 60;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLayoutController>(
        init: SocialLayoutController(),
        builder: (socialLayoutController) {
          var socialUserModel = socialLayoutController.socialUserModel!;
          return Scaffold(
            appBar: defaultAppBar(
                context: context,
                title: "Edit Profile",
                actions: [
                  defaultTextButton(onpress: () {}, text: "Update"),
                  SizedBox(
                    width: 15,
                  )
                ]),
            body: Column(
              children: [
                Container(
                  height: 220,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      //NOTE : Cover Image
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        socialUserModel.coverimage.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                    radius: 20,
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 17,
                                    ))),
                          ],
                        ),
                      ),
                      //NOTE profileImage
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: profileheight + 3,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: profileheight,
                              backgroundImage: NetworkImage(
                                  socialUserModel.image.toString()),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: CircleAvatar(
                                  radius: 20,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 17,
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
  }
}
