import 'package:auth/utils/google_signin_controller.dart';
import 'package:auth/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/constants.dart';

class GoogleSiginIn extends StatefulWidget {
  @override
  _GoogleSiginInState createState() => _GoogleSiginInState();
}

class _GoogleSiginInState extends State<GoogleSiginIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C4957),
      body: loginUI(),
    );
  }

  loginUI() {
    return Consumer<GoogleSigninController>(builder: (context, model, child) {
      if (model.googleAccount != null) {
        return logedInUI(model);
      } else {
        return loginControls(context);
      }
    });
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
                  "assets/google.png",
                  height: 25,
                  width: 25,
                  color: Color(0xffbb967c),
                ),
                Text(
                  "Connect with Google",
                  style: kButtonStyle,
                ),
                Container(
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          onPressed: () {
            Provider.of<GoogleSigninController>(context, listen: false).logIn();
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
          "assets/g_gif.gif",
          height: 260,
          width: 260,
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Text(
            'Connect yourself with the worlds largest multinational technology company.',
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

  logedInUI(GoogleSigninController model) {
    return Container(
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
                CircleAvatar(
                  backgroundImage:
                      Image.network(model.googleAccount!.photoUrl ?? '').image,
                  radius: 80.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  model.googleAccount!.displayName ?? '',
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
                  model.googleAccount!.email,
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      Provider.of<GoogleSigninController>(context,
                              listen: false)
                          .logOut();
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  loginControls(BuildContext context) {
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
}
