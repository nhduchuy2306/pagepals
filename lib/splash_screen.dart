import 'dart:convert';
import 'dart:ffi';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pagepals/helpers/color_helper.dart';
import 'package:pagepals/main.dart';
import 'package:pagepals/models/authen_models/account_model.dart';
import 'package:pagepals/screens/screens_authorization/signin_screen/signin_intro/signin_home.dart';
import 'package:pagepals/screens/screens_customer/menu_item/menu_item_screen.dart';
import 'package:pagepals/services/authen_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? accessToken;

  @override
  void initState() {
    super.initState();
    setupPageTransition();
  }

  setupPageTransition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      accessToken = prefs.getString('accessToken');
    });
    // if (accessToken != null) {
    //   print('accessToken: $accessToken');
    //   // get expiration time
    //   int exp = JWT.decode(accessToken!).payload['exp'];
    //   DateTime expirationDateTime =
    //       DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    //   print('expirationDateTime: $expirationDateTime');
    //   if (DateTime.now().isAfter(expirationDateTime)) {
    //     prefs.clear();
    //     setState(() {
    //       accessToken = null;
    //     });
    //   }
    // }
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: accessToken == null
              ? const SigninHomeScreen()
              : const MenuItemScreen(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "PAGEPALS.",
                  textStyle: GoogleFonts.openSans(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: ColorHelper.getColor(ColorHelper.normal),
                  ),
                  speed: const Duration(milliseconds: 70),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ],
        ),
      ),
    );
  }
}
