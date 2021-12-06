import 'package:flutter/material.dart';

class MessagingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 15,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(
                'assets/person.png',
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Chat",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
        actions: [
          CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue.shade600,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt),
                iconSize: 20,
                color: Colors.white,
              )),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue.shade600,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
                iconSize: 20,
                color: Colors.white,
              )),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Search"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "samih ahmad damaj",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "samih ahmad damaj",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "samih ahmad damaj",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "samih ahmad damaj",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "samih ahmad damaj",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "samih ahmad damaj",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "samih ahmad damaj",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "samih ahmad damaj ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("11:00 AM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "samih ahmad damaj ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("11:00 AM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "samih ahmad damaj ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("11:00 AM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "samih ahmad damaj ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("11:00 AM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "samih ahmad damaj ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("11:00 AM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "samih ahmad damaj ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("11:00 AM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/person.png"),
                            ),
                            // CircleAvatar(
                            //   radius: 8,
                            //   backgroundColor: Colors.white,
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 4, end: 4),
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "samih ahmad damaj ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee chu wenak ya zalameee",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("11:00 AM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
