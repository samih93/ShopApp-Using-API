import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MaterialButton(onPressed: () {
        signOut();
      },child: Text("SignOut"),),
    );
  }
}
