import 'package:barter_it/model/user.dart';
import 'package:barter_it/screens/uploadimagescreen.dart';
import 'package:flutter/material.dart';

class NewItemSplashScreen extends StatefulWidget {
  final User user;

  const NewItemSplashScreen({super.key, required this.user});

  @override
  State<NewItemSplashScreen> createState() => _NewItemSplashScreenState();
}

class _NewItemSplashScreenState extends State<NewItemSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 480,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background3.jpg'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              left: 16,
              top: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
                color: Colors.black,
                iconSize: 40,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 520, left: 30, right: 20),
            child: Column(
              children: [
                const Text(
                  "Become a Seller in 2 easy steps",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Just upload the image and some details of your item. Join us now.",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                const SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  child: const Text(
                    'Let\'s go!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (content) => UploadImageScreen(
                                  user: widget.user,
                                )));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      padding: MaterialStateProperty.all(const EdgeInsets.only(
                          left: 130, right: 130, top: 15, bottom: 15)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 20))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
