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
              backgroundColor: Colors.blue.shade400,
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
              backgroundColor: Colors.blue.shade400,
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
      body: Column(
        children: [
          Icon(Icons.search),
          SizedBox(
            width: 15,
          ),
          Text("Search"),
        ],
      ),
    );
  }
}
