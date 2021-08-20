// @dart=2.9

import 'package:auth/UI/pages/home_page.dart';
import 'package:auth/UI/social_pages/google_signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'components/constants.dart';
import 'utils/google_signin_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSigninController(),
          child: GoogleSiginIn(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth',
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          fontFamily: GoogleFonts.nunito().fontFamily,
        ),
        home: HomePage(),
      ),
    );
  }
}
