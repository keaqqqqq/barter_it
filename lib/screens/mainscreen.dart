import 'package:barter_it/screens/loginregistersplashscreen.dart';
import 'package:barter_it/screens/profiletabscreen.dart';
import 'package:flutter/material.dart';
import '../../model/user.dart';
import 'buyertabscreen.dart';
import 'loginscreen.dart';
import 'newstabscreen.dart';
import 'sellertabscreen.dart';

//for buyer screen

class MainScreen extends StatefulWidget {
  final User user;
  final int currentIndex;

  const MainScreen({Key? key, required this.user, this.currentIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> tabchildren;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    tabchildren = [
      BuyerTabScreen(user: widget.user),
      SellerTabScreen(user: widget.user),
      ProfileTabScreen(user: widget.user),
      NewsTabScreen(user: widget.user),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabchildren[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money,
                ),
                label: "Buyer"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.store_mall_directory,
              ),
              label: "Seller",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.newspaper,
                ),
                label: "News")
          ]),
    );
  }

  void onTabTapped(int value) {
    if ((value == 1 || value == 2 || value == 3) && widget.user.id == "na") {
      // Navigate to the login screen
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginRegisterSplashScreen()),
      );
      return;
    }
    setState(() {
      _currentIndex = value;
    });
  }
}
