import 'package:auth/UI/social_pages/fb_signin.dart';
import 'package:auth/UI/social_pages/google_signin.dart';
import 'package:auth/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/hexagon.clippath.util.dart';

class ChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff2e4d5f),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
            child: Text(
              'Choose your favorite Social App',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30.0,
                height: 1.5,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.all(4.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                            height: 130,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GoogleSiginIn()));
                              },
                              child: Card(
                                borderOnForeground: true,
                                color: Color(0xffBB967C),
                                elevation: 3,
                                shadowColor: muted.withOpacity(0.22),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  bottomLeft:
                                                      Radius.circular(4.0)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/g_blue.png"),
                                              ))),
                                    ),
                                    Flexible(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Google",
                                                  style: TextStyle(
                                                      color: Color(0xff2e4d5f),
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w900)),
                                              Text("Go with Google ➲",
                                                  style: TextStyle(
                                                      color: Color(0xff2e4d5f),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                            height: 130,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FBSiginIn()));
                              },
                              child: Card(
                                borderOnForeground: true,
                                color: Color(0xffBB967C),
                                elevation: 3,
                                shadowColor: muted.withOpacity(0.22),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  bottomLeft:
                                                      Radius.circular(4.0)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/fb_blue.png"),
                                              ))),
                                    ),
                                    Flexible(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Facebook",
                                                  style: TextStyle(
                                                      color: Color(0xff2e4d5f),
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w900)),
                                              Text("Go with Facebook ➲",
                                                  style: TextStyle(
                                                      color: Color(0xff2e4d5f),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ]),
              ))
            ],
          ),
        ]),
      ),
    ));
  }
}
