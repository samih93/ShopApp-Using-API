import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              // for validate
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultTextFormField(
                      inputtype: TextInputType.emailAddress,
                      controller: emailController,
                      text: 'Email Address',
                      prefixIcon: Icon(Icons.email),
                      onvalidate: (value) {
                        if (value!.isEmpty) {
                          return 'Email must be not empty';
                        }
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultTextFormField(
                      inputtype: TextInputType.phone,
                      controller: passwordController,
                      text: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      isPassword: true,
                      suffixIcon: Icon(Icons.remove_red_eye),
                      onvalidate: (value) {
                        if (value!.isEmpty) {
                          return 'Password must be not empty';
                        }
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      text: 'Login',
                      onpress: () {
                        if (_formkey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      }),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
