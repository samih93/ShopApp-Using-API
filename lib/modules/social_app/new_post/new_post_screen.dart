import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class NewPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: "Add Post"),
    );
  }
}
