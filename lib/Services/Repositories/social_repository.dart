import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SocialRepository {
  Future<dynamic> login();

  static Future<AccessToken> isLogin() async {
  }
}
class AppleLoginRepository extends SocialRepository{
  @override
  Future login() {
    // TODO: implement login
    throw UnimplementedError();
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




class GoogleLoginRepository extends SocialRepository{
  @override
  Future login() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    final GoogleSignInAccount googleSignInAccount =
    await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

       final  user = userCredential.user;
       print(user.toString());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }
  }

}