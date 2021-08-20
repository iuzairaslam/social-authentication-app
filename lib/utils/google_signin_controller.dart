import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninController with ChangeNotifier {
  var _googleSIgnIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  logIn() async {
    this.googleAccount = await _googleSIgnIn.signIn();
    notifyListeners();
  }

  logOut() async {
    this.googleAccount = await _googleSIgnIn.signOut();
    notifyListeners();
  }
}
