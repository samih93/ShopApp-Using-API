import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/social_app/social_layout_controller.dart';
import 'package:udemy_flutter/models/social_app/post_model.dart';
import 'package:udemy_flutter/models/social_app/social_usermodel.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class SocialFeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLayoutController>(
        init: Get.find<SocialLayoutController>(),
        builder: (socialLayoutController) {
          return socialLayoutController.isloadingGetPosts!
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          elevation: 20,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: EdgeInsets.all(8),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Image(
                                width: double.infinity,
                                image: NetworkImage(
                                    'https://th.bing.com/th/id/OIP.ETZZzWARLT4iT9YLX3930QHaEo?pid=ImgDet&rs=1'),
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Communicate with friends",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.separated(
                          itemBuilder: (context, index) => buildPostItem(
                              socialLayoutController.listOfPost[index],
                              context,
                              index),
                          itemCount: socialLayoutController.listOfPost.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, int index) => SizedBox(
                            height: 10,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                );
        });
  }

  Widget buildPostItem(PostModel model, BuildContext context, int index) =>
      GetBuilder<SocialLayoutController>(
        init: Get.find<SocialLayoutController>(),
        builder: (socialLayoutController) => Card(
            elevation: 5,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //NOTE : header of post (circle avatar and name and date of post)
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            socialLayoutController.listOfPost[index].image ==
                                        null ||
                                    socialLayoutController
                                            .listOfPost[index].image ==
                                        ""
                                ? AssetImage('assets/default profile.png')
                                    as ImageProvider
                                : NetworkImage(socialLayoutController
                                    .listOfPost[index].image!),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${model.name}',
                                style: TextStyle(height: 1.4),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              socialLayoutController.listOfPost[index].uId! ==
                                          uId &&
                                      socialLayoutController
                                          .socialUserModel!.isemailverified!
                                  ? Icon(
                                      Icons.check_circle,
                                      color: defaultColor,
                                      size: 16,
                                    )
                                  : SizedBox(
                                      width: 0,
                                    ),
                            ],
                          ),
                          Text(
                            "${convertToAgo(DateTime.parse(model.postdate!))}",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(height: 1.4),
                          ),
                        ],
                      )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                          )),
                    ],
                  ),
                  //NOTE: Divider()
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  //NOTE: post body()
                  Text('${model.text}'),
                  //NOTE : Tags
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 7.0),
                            child: Container(
                              height: 25,
                              child: MaterialButton(
                                  padding: EdgeInsets.zero,
                                  minWidth: 1,
                                  onPressed: () {},
                                  child: Text(
                                    "#software_Engineer",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: defaultColor,
                                        ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //NOTE : Image Of post
                  if (model.postImage != "")
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: NetworkImage('${model.postImage}'),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                  //NOTE : Likes And Comments
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Row(
                              children: [
                                Icon(Icons.favorite_border, color: Colors.red),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  socialLayoutController
                                      .listOfPost[index].nbOfLikes
                                      .toString(),
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.comment_rounded,
                                    color: Colors.amber),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "0 comments",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  //NOTE: Divider()
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  //NOTE : Write a Comment  and like post
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundImage: socialLayoutController
                                                  .socialUserModel!.image ==
                                              null ||
                                          socialLayoutController
                                                  .socialUserModel!.image ==
                                              ""
                                      ? AssetImage('assets/default profile.png')
                                          as ImageProvider
                                      : NetworkImage(
                                          '${socialLayoutController.socialUserModel!.image}'),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text("Write a Comment",
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
                        InkWell(
                          child: Row(
                            children: [
                              Icon(
                                  socialLayoutController
                                          .listOfPost[index].isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Like",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          onTap: () {
                            if (socialLayoutController
                                    .listOfPost[index].isLiked ==
                                true) {
                              socialLayoutController.likePost(
                                  socialLayoutController
                                      .listOfPost[index].postId
                                      .toString(),
                                  index,
                                  isForremove: true);
                            } else {
                              socialLayoutController.likePost(
                                  socialLayoutController
                                      .listOfPost[index].postId
                                      .toString(),
                                  index);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      );
}
