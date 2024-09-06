import 'package:day14/custom_widget/login_page.dart';
import 'package:day14/custom_widget/register.dart';
import 'package:flutter/material.dart';
import 'package:day14/custom_widget/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050522),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                image: AssetImage('images/Illustration Picture.png'),
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                  color: Color(0xffEF5858),
                  fontSize: 36,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  textAlign: TextAlign.center,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                  style: TextStyle(
                    color: Color(0xffF4F4F4),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              CustomButton(
                text: "Sign up",
                BG: Colors.yellow,
                buttonSheet: const SignUpBottomSheet(), // Optional: Create SignUpBottomSheet
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Log in",
                BG: Colors.transparent,
                textcolor: Colors.white,
                buttonSheet: const LoginBottomSheet(), // Pass the LoginBottomSheet here
              ),
              const SizedBox(height: 50),
              const Text(
                'All Rights Reserved @2021',
                style: TextStyle(color: Color(0xffFFDE69), fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
