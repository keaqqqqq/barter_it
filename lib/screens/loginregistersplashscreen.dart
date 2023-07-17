import 'package:barter_it/screens/registrationscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginscreen.dart';

class LoginRegisterSplashScreen extends StatefulWidget {
  const LoginRegisterSplashScreen({Key? key}) : super(key: key);

  @override
  State<LoginRegisterSplashScreen> createState() =>
      _LoginRegisterSplashScreenState();
}

class _LoginRegisterSplashScreenState extends State<LoginRegisterSplashScreen> {
  double fem = 1.0; // Assign a value to fem

  void navigateToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void navigateToRegisterScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
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
            SizedBox(
              width: double.infinity,
              height: 150 * fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 20 * fem,
                    top: 50 * fem,
                    child: GestureDetector(
                      onTap:
                          navigateToLoginScreen, // Navigate to the Login screen
                      child: Container(
                        width: 167 * fem,
                        height: 52 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff000000)),
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(6 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'LOG IN',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 13 * fem,
                              fontWeight: FontWeight.w900,
                              height: 1.1725 * fem,
                              letterSpacing: 0.52 * fem,
                              color: const Color(0xff000000),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220 * fem,
                    top: 50 * fem,
                    child: GestureDetector(
                      onTap:
                          navigateToRegisterScreen, // Navigate to the Register screen
                      child: Container(
                        width: 167 * fem,
                        height: 52 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xff000000),
                          borderRadius: BorderRadius.circular(6 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'REGISTER',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 13 * fem,
                              fontWeight: FontWeight.w900,
                              height: 1.1725 * fem,
                              letterSpacing: 0.52 * fem,
                              color: const Color(0xffffffff),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140 * fem,
                    top: 130 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 135 * fem,
                        height: 5 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10 * fem),
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
