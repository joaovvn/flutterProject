// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project1/components/login/custom_login_button_component.dart';
import 'package:project1/controllers/login_controller.dart';
import 'package:project1/widgets/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * 0.3,
            ),
            CustomTextField(
              onChanged: _controller.setLogin,
              icon: Icons.person,
              label: 'Login',
            ),
            CustomTextField(
              onChanged: _controller.setPass,
              label: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(
              height: 15,
            ),
            CustomLoginButtonComponent(
              loginController: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
