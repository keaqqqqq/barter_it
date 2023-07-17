import 'dart:convert';
import 'dart:developer';

import 'package:barter_it/model/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/item.dart';
import '../myconfig.dart';
import 'buyerdetailscreen.dart';

class BuyerSavedScreen extends StatefulWidget {
  final User user;

  const BuyerSavedScreen({super.key, required this.user});

  @override
  State<BuyerSavedScreen> createState() => _BuyerSavedScreenState();
}

class _BuyerSavedScreenState extends State<BuyerSavedScreen> {
  List<Item> itemList = <Item>[];
  int numberofresult = 0;
  late User user = User(
      id: "na",
      name: "na",
      email: "na",
      phone: "na",
      datereg: "na",
      password: "na",
      otp: "na");

  @override
  void initState() {
    super.initState();
    loadSavedItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved Items ")),
      body: Column(
        children: [
          itemList.isEmpty
              ? Container()
              : Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(itemList.length, (index) {
                        return Card(
                          child: InkWell(
                            onTap: () async {
                              Item useritem =
                                  Item.fromJson(itemList[index].toJson());
                              print(useritem.itemName);
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (content) => BuyerDetailScreen(
                                            user: widget.user,
                                            useritem: useritem,
                                            page: 1,
                                          )));
                              //loadCatches();
                            },
                            child: Column(children: [
                              CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    "${ServerConfig.SERVER}/barter_it/assets/photo/${itemList[index].itemId}_1.jpg",
                                placeholder: (context, url) =>
                                    const LinearProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              Text(
                                itemList[index].itemName.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                "RM ${double.parse(itemList[index].itemPrice.toString()).toStringAsFixed(2)}",
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "${itemList[index].itemQty} available",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ]),
                          ),
                        );
                      })))
        ],
      ),
    );
  }

  void loadSavedItems() {
    http.post(
        Uri.parse("${ServerConfig.SERVER}/barter_it/php/load_saveditems.php"),
        body: {
          "userid": widget.user.id,
        }).then((response) {
      print("Saved Items");
      print(response.body);
      itemList.clear();
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        if (jsondata['status'] == "success") {
          var extractdata = jsondata['data'];
          extractdata['saveddetails'].forEach((v) {
            itemList.add(Item.fromJson(v));
          });
        }
        setState(() {});
      }
    });
  }
}
