import 'package:barter_it/model/user.dart';
import 'package:flutter/material.dart';
import 'package:barter_it/model/user.dart';
import '../../model/user.dart';

//for buyer screen

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Main Screen'),
      ),
    );
  }
}
