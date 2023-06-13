import 'package:barter_it/model/user.dart';
import 'package:barter_it/screens/registrationscreen.dart';
import 'package:flutter/material.dart';

import 'buyertabscreen.dart';
import 'loginscreen.dart';
import 'newstabscreen.dart';
import 'sellertabscreen.dart';

// for profile screen

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key, required User user});

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
  late List<Widget> tabchildren;
  String maintitle = "Profile";
  late double screenHeight, screenWidth, cardwitdh;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: screenHeight * 0.4,
          width: screenWidth,
          child: Card(
            child: Column(children: [Text("Profile info")]),
          ),
        ),
        Container(
          width: screenWidth,
          alignment: Alignment.center,
          color: Theme.of(context).colorScheme.background,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: Text("PROFILE SETTINGS",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (content) => const LoginScreen()));
              },
              child: const Text("LOGIN"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (content) => const RegistrationScreen()));
              },
              child: const Text("REGISTRATION"),
            ),
          ],
        ))
      ]),
    );
  }
}
