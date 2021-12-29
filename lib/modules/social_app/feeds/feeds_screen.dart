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
            Card(
                elevation: 20,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                      Container(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            MaterialButton(
                                padding: EdgeInsets.zero,
                                minWidth: 1,
                                onPressed: () {},
                                child: Text(
                                  "#software",
                                  style: TextStyle(color: defaultColor),
                                )),
                            MaterialButton(
                                padding: EdgeInsets.zero,
                                minWidth: 1,
                                onPressed: () {},
                                child: Text(
                                  "#Engineer",
                                  style: TextStyle(color: defaultColor),
                                )),
                            MaterialButton(
                                padding: EdgeInsets.zero,
                                minWidth: 1,
                                onPressed: () {},
                                child: Text(
                                  "#developement",
                                  style: TextStyle(color: defaultColor),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://th.bing.com/th/id/OIP.ETZZzWARLT4iT9YLX3930QHaEo?pid=ImgDet&rs=1'),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
