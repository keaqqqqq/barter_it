import 'dart:convert';
import 'dart:developer';

import 'package:barter_it/screens/uploadimagescreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/item.dart';
import '../model/user.dart';
import '../myconfig.dart';
import 'newitemsplashscreen.dart';

// for fisherman screen

class SellerTabScreen extends StatefulWidget {
  final User user;
  const SellerTabScreen({super.key, required this.user});

  @override
  State<SellerTabScreen> createState() => _SellerTabScreenState();
}

class _SellerTabScreenState extends State<SellerTabScreen> {
  late double screenHeight, screenWidth;
  late int axiscount = 2;
  String maintitle = "Seller";
  List<Item> itemList = <Item>[];

  @override
  void initState() {
    super.initState();
    loadselleritems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      axiscount = 3;
    } else {
      axiscount = 2;
    }
    return Scaffold(
        backgroundColor: Color.fromRGBO(237, 237, 237, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Listings',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (widget.user.id != "na") {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (content) => NewItemSplashScreen(
                        user: widget.user,
                      ),
                    ),
                  );
                  loadselleritems();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please login/register an account"),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.add, size: 30),
            ),
          ],
        ),
        body: itemList.isEmpty
            ? RefreshIndicator(
                onRefresh: refresh,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 380,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11.0),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/background.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Get a trade for your item',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              const Text(
                                ' with Barter-IT',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
            : RefreshIndicator(
                onRefresh: refresh,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Column(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 380,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11.0),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/background.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'Get a trade for your item',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  const Text(
                                    ' with Barter-IT',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            //padding: <-- Using to shift text position a little bit for your requirement
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: axiscount,
                          childAspectRatio: 0.8,
                          children: List.generate(
                            itemList.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(0),
                                child: Card(
                                  elevation: 5,
                                  child: InkWell(
                                    onLongPress: () {
                                      onDeleteDialog(index);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          child: CachedNetworkImage(
                                            width: screenWidth,
                                            height: 150,
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                "${ServerConfig.SERVER}/barter_it/assets/photo/${itemList[index].itemId}_1.jpg",
                                            placeholder: (context, url) =>
                                                const LinearProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                        Text(
                                          itemList[index].itemName.toString(),
                                          style: const TextStyle(fontSize: 20),
                                          textAlign: TextAlign.start,
                                        ),
                                        const SizedBox(
                                          height: 31,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "RM${double.parse(itemList[index].itemPrice.toString()).toStringAsFixed(2)}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.red),
                                            ),
                                            Text(
                                              "${itemList[index].itemQty} available",
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
  }

  void loadselleritems() {
    if (widget.user.id == "na") {
      setState(() {
        // titlecenter = "Unregistered User";
      });
      return;
    }

    http.post(Uri.parse("${ServerConfig.SERVER}/barter_it/php/load_items.php"),
        body: {"userid": widget.user.id}).then((response) {
      //print(response.body);
      log(response.body);
      itemList.clear();
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        if (jsondata['status'] == "success") {
          var extractdata = jsondata['data'];
          extractdata['items'].forEach((v) {
            itemList.add(Item.fromJson(v));
          });
        }
        setState(() {});
      }
    });
  }

  void onDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Delete ${itemList[index].itemName}?",
          ),
          content: const Text("Are you sure?", style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                deleteitem(index);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deleteitem(int index) {
    http.post(
        Uri.parse("${ServerConfig.SERVER}/barter_it/php/delete_items.php"),
        body: {
          "userid": widget.user.id,
          "itemid": itemList[index].itemId
        }).then((response) {
      print(response.body);
      //itemList.clear();
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        if (jsondata['status'] == "success") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Delete Success")));
          loadselleritems();
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Failed")));
        }
      }
    });
  }

  Future<void> refresh() async {
    setState(() {
      loadselleritems();
    });
  }
}
