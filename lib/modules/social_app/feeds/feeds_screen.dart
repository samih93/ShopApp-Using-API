import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class SocialFeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              itemBuilder: (context, index) => buildPostItem(context),
              itemCount: 10,
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
  }

  Widget buildPostItem(BuildContext context) => Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //NOTE : header of post (circle avatar and name and date of post)
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/a-/AOh14GgzR_P3O_71eptoflnQWXvVAidn3BTVooIABjTakQ=s288-p-rw-no'),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'samih damaj',
                          style: TextStyle(height: 1.4),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: defaultColor,
                          size: 16,
                        ),
                      ],
                    ),
                    Text(
                      "Jan 21, 2021 at 11:00 pm",
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
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
            //NOTE : Tags
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
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
            Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.ETZZzWARLT4iT9YLX3930QHaEo?pid=ImgDet&rs=1'),
                    fit: BoxFit.cover,
                  ),
                )),
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
                            "1230",
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
                          Icon(Icons.comment_rounded, color: Colors.amber),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "1230 comments",
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
                            backgroundImage: NetworkImage(
                                'https://lh3.googleusercontent.com/a-/AOh14GgzR_P3O_71eptoflnQWXvVAidn3BTVooIABjTakQ=s288-p-rw-no'),
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
                        Icon(Icons.favorite_border, color: Colors.red),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Like",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
}
