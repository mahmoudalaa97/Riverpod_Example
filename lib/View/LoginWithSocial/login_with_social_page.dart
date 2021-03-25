import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:state_managment/Services/Repositories/social_repository.dart';
import 'package:state_managment/Widgets/custom_button.dart';
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
  SocialRepository _repository ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login With Social Page"),
      ),
      body: FutureBuilder<AccessToken>(
        future: null,
        builder: (context, snapshot) {
          if( snapshot.hasData){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${snapshot.data.userId}"),
                Buttons(
                  title: "Logout",
                  onTap: (){},
                )
              ],
            );
          }else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonSocial(
                  socialRepository: AppleLoginRepository(),
                  title: "Apple",
                  fontAwesomeIcons: FontAwesomeIcons.apple,
                  backgroundColor: Colors.black54,
                ),
                CustomButtonSocial(
                  socialRepository: FacebookLoginRepository(),
                  title: "Facebook",
                  fontAwesomeIcons: FontAwesomeIcons.facebook,
                  backgroundColor: Colors.blue[800],
                ),
                CustomButtonSocial(
                  socialRepository: GoogleLoginRepository(),
                  title: "Google",
                  fontAwesomeIcons: FontAwesomeIcons.google,
                  backgroundColor: Colors.red[800],
                )
              ],
            );
          }
        },

      ),
    );
  }
}
