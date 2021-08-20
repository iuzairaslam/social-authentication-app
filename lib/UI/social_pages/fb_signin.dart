import 'package:auth/components/constants.dart';
import 'package:auth/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class FBSiginIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FBSiginInState();
  }
}

class _FBSiginInState extends State<FBSiginIn> {
  liginControls(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30.0, top: 100.0, bottom: 5),
      child: ResponsiveWidget(
        mobile: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildHeader(),
            buildButtons(),
          ],
        ),
        tab: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildHeader(),
            buildButtons(),
          ],
        ),
      ),
    );
  }

  Column buildButtons() {
    return Column(
      children: [
        FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xffbb967c),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          textColor: Color(0xffbb967c),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/fb.png",
                  height: 25,
                  width: 25,
                  color: Color(0xffbb967c),
                ),
                Text(
                  "Connect with Facebook",
                  style: kButtonStyle,
                ),
                Container(
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          onPressed: () {
            loginWithFB();
          },
        ),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }

  Column buildHeader() {
    return Column(
      children: [
        Image.asset(
          "assets/fb_gif.gif",
          height: 260,
          width: 260,
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Text(
            'Connect yourself with the worlds largest social networking site that makes it easy for you to connect and share with family and friends online.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              height: 2,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }

  bool isLoggedIn = false;
  Map? userProfile;
  final facebookLogin = FacebookLogin();

  loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => isLoggedIn = false);
        break;
    }
  }

  _logout() {
    facebookLogin.logOut();
    setState(() {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff2C4957),
        body: Center(
            child: isLoggedIn
                ? Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          Color(0xff2c4957),
                          Color(0xff2e4d5f),
                        ])),
                    child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(80.0),
                                child: Image.network(
                                  userProfile!["picture"]["data"]["url"],
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                userProfile!["name"],
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                userProfile!["email"],
                                style: kEmailStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 100, right: 100, top: 20, bottom: 0),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Color(0xffbb967c),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  textColor: Color(0xffbb967c),
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: Color(0xffbb967c),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Logout",
                                          style: kSmallButtonStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    _logout();
                                  },
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                : liginControls(context)),
        // Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           Image.network(
        //             userProfile!["picture"]["data"]["url"],
        //             height: 50.0,
        //             width: 50.0,
        //           ),
        //           Text(userProfile!["name"]),
        //           Text(userProfile!["email"]),
        //           OutlineButton(
        //             child: Text("Logout"),
        //             onPressed: () {
        //               _logout();
        //             },
        //           )
        //         ],
        //       )
      ),
    );
  }
}
