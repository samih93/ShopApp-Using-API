import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType inputtype,
  Function(String?)? onfieldsubmit,
  String? Function(String?)? onvalidate,
  String? text,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool obscure = false,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: inputtype,
        onFieldSubmitted: onfieldsubmit,
        obscureText: obscure,
        // onChanged: (String value) {
        //   print(value);
        // },
        decoration: InputDecoration(
          labelText: text,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(),
        ),
        validator: onvalidate);
