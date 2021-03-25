import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

abstract class SocialRepository {
  Future<dynamic> login();

  static Future<AccessToken> isLogin() async {
  }
}

class FacebookLoginRepository extends SocialRepository {

  @override
  Future login() async {
    // Trigger the sign-in flow
    final AccessToken result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    final userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    print(userCredential.user.toString());

  }
}





}