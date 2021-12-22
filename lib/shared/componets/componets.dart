import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/todo_app/todo_layoutcontroller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:udemy_flutter/modules/news_app/web_view/webview_screen.dart';

Widget defaultButton(
        {double width = double.infinity,
        Color background = Colors.blue,
        VoidCallback? onpress,
        required String text,
        double radius = 0,
        double height = 40,
        bool? isUppercase}) =>
    Container(
      width: width,
      child: MaterialButton(
        height: height,
        onPressed: onpress,
        child: Text(
          (isUppercase != null && isUppercase) ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

Widget defaultTextButton(
        {@required VoidCallback? onpress, @required String? text}) =>
    TextButton(
      onPressed: onpress,
      child: Text(
        text!,
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType inputtype,
  Function(String?)? onfieldsubmit,
  VoidCallback? ontap,
  String? Function(String?)? onvalidate,
  Function(String?)? onchange,
  String? text,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool obscure = false,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: inputtype,
        onFieldSubmitted: onfieldsubmit,
        onTap: ontap,
        obscureText: obscure,
        onChanged: onchange,
        decoration: InputDecoration(
          labelText: text,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(),
        ),
        validator: onvalidate);

Widget buildTaskItem(Map map) => GetBuilder<TodoLayoutController>(
      init: Get.find<TodoLayoutController>(),
      builder: (todocontroller) => Dismissible(
        key: Key(map['id']),
        onDismissed: (direction) {
          todocontroller.deleteTask(taskId: map['id'].toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                child: Text(
                  "${map['time']}",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${map['title']}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "${map['date']}",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                        onPressed: () {
                          todocontroller.updatestatusTask(
                              taskId: map["id"].toString(), status: "done");
                        },
                        icon: Icon(Icons.check_box, color: Colors.green)),
                    IconButton(
                        onPressed: () {
                          todocontroller.updatestatusTask(
                              taskId: map["id"].toString(), status: "archive");
                        },
                        icon: Icon(Icons.archive, color: Colors.black45)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

// circular indicator then show list of tasks or archived taks or finished task
Widget tasksBuilder({required List<Map> tasks, required String message}) =>
    tasks.length == 0
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu, size: 60, color: Colors.grey),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$message",
                  style: TextStyle(fontSize: 23, color: Colors.grey),
                ),
              ],
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) => buildTaskItem(tasks[index]),
            separatorBuilder: (context, index) => Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: 1,
                ),
            itemCount: tasks.length);

Widget myDivider() => Container(
      color: Colors.grey,
      width: double.infinity,
      height: 1,
    );
Widget buildArticleItem(article, context) => Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          Get.to(WebViewScreen(article['url']));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  // image: DecorationImage(

                  //     image: NetworkImage(article['urlToImage'].toString()),

                  //     fit: BoxFit.cover)),
                ),
                child: CachedNetworkImage(
                  imageUrl: article['urlToImage'].toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        // colorFilter: ColorFilter.mode(
                        //     Colors.red, BlendMode.colorBurn)
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/notfound.png"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          article['title'],
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        getDateFormated(article['publishedAt']),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

String getDateFormated(String date) {
  List<String> listdate = date.split("T");
  List<String> list1date = listdate[1].split(":");
  return list1date[0] + ":" + list1date[1] + "   " + listdate[0];
}

void showToast({required message, required ToastStatus status}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(status),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStatus { Success, Error, Warning }

Color chooseToastColor(ToastStatus status) {
  Color color;
  switch (status) {
    case ToastStatus.Success:
      color = Colors.green;
      break;
    case ToastStatus.Error:
      color = Colors.red;
      break;
    case ToastStatus.Warning:
      color = Colors.amber;
      break;
  }
  return color;
}
