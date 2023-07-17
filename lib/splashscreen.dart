import 'dart:async';
import 'dart:convert';
import 'package:barter_it/screens/buyertabscreen.dart';
import 'package:barter_it/screens/loginscreen.dart';
import 'package:barter_it/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'model/user.dart';
import 'myconfig.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  double fem = 1.0;
  @override
  void initState() {
    super.initState();
    checkAndLogin();
    //Timer(
    //    const Duration(seconds: 3),
    //   () => Navigator.pushReplacement(context,
    //        MaterialPageRoute(builder: (content) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xfffc961e),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  110 * fem, 360 * fem, 94.5 * fem, 210 * fem),
              width: double.infinity,
              height: 717.42 * fem,
              decoration: const BoxDecoration(
                color: Color(0xfffc961e),
              ),
              child: SizedBox(
                child: Row(
                  children: [
                    Container(
                      // vectorESZ (4:46)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 16.5 * fem, 0 * fem),
                      width: 32 * fem,
                      height: 120 * fem,
                      child: const Icon(Icons.shopping_cart_rounded, size: 40),
                    ),
                    Center(
                      child: Text(
                        'Barter-IT',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                          fontSize: 32 * fem,
                          fontWeight: FontWeight.w400,
                          height: 1.115 * fem,
                          letterSpacing: -0.48 * fem,
                          color: const Color(0xff000000),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkAndLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = (prefs.getString('email')) ?? '';
    String password = (prefs.getString('pass')) ?? '';
    bool ischeck = (prefs.getBool('checkbox')) ?? false;
    late User user;
    if (ischeck && email.isNotEmpty && password.isNotEmpty) {
      http.post(
          Uri.parse("${ServerConfig.SERVER}/barter_it/php/login_user.php"),
          body: {"email": email, "password": password}).then((response) {
        if (response.statusCode == 200) {
          var jsondata = jsonDecode(response.body);
          user = User.fromJson(jsondata['data']);
          print('login successful');
          print(user.name);
          print(user.email);
          print(user.password);
          Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (content) => MainScreen(user: user))));
        } else {
          user = User(
              id: "na", name: "na", email: "na", datereg: "na", password: "na");
          Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (content) => MainScreen(user: user))));
        }
      }).timeout(const Duration(seconds: 5));
    } else {
      user = User(
        id: "na",
        name: "na",
        email: "na",
        datereg: "na",
        password: "na",
      );
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (content) => MainScreen(user: user))));
    }
  }
}
