import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_flutter/models/shop_app/boarding_model.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boardingList = [
    BoardingModel(
        image: 'assets/shop_onboard.jpg',
        tilte: "Title 1",
        subtitle: "Sub Title 1"),
    BoardingModel(
        image: 'assets/shop_onboard.jpg',
        tilte: "Title 2",
        subtitle: "Sub Title 2"),
    BoardingModel(
        image: 'assets/shop_onboard.jpg',
        tilte: "Title 3",
        subtitle: "Sub Title 3")
  ];

  PageController boardController = PageController();

  bool islast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () => Get.off(ShopLoginScreen()),
              child: Text(
                "SKIP",
                style:
                    TextStyle(color: defaultColor, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: boardController,
                    onPageChanged: (index) {
                      if (index == boardingList.length - 1) {
                        setState(() {
                          islast = true;
                        });
                        print('last');
                      } else {
                        setState(() {
                          islast = false;
                        });
                        print('not last');
                      }
                    },
                    physics: BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) =>
                        buildOnBoaringItem(boardingList[index])),
              ),
              SizedBox(height: 35),
              Row(
                children: [
                  SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          activeDotColor: defaultColor,
                          expansionFactor: 4,
                          spacing: 5,
                          dotWidth: 10),
                      controller: boardController,
                      count: boardingList.length),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (!islast)
                        boardController.nextPage(
                            duration: Duration(microseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      else
                        Get.off(ShopLoginScreen());
                      print(islast);
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget buildOnBoaringItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: Image(image: AssetImage(model.image))),
          Text(
            model.tilte,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            model.subtitle,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      );
}
