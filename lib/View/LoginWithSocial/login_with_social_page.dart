import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:state_managment/Widgets/custom_button_social.dart';

///************************************************************
///TODO Login With Social Media API and Connect it with Firebase:
///
/// 1- Login with Apple
/// 2- Login with Facebook
/// 3- Login with google
/// 4- login with Github
///
/// *********************

class LoginWithSocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login With Social Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtonSocial(
            title: "Apple",
            fontAwesomeIcons: FontAwesomeIcons.apple,
            backgroundColor: Colors.black54,
            onTap: (){

            },
          ),
          CustomButtonSocial(
            title: "Facebook",
            fontAwesomeIcons: FontAwesomeIcons.facebook,
            backgroundColor: Colors.blue[800],
            onTap: (){

            },
          ),
          CustomButtonSocial(
            title: "Google",
            fontAwesomeIcons: FontAwesomeIcons.google,
            backgroundColor: Colors.red[800],
            onTap: (){

            },
          )
        ],
      ),
    );
  }
}
