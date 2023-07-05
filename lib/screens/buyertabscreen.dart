import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/item.dart';
import '../model/user.dart';
import '../myconfig.dart';
import 'buyerdetailscreen.dart';

//for buyer screen

class BuyerTabScreen extends StatefulWidget {
  final User user;
  const BuyerTabScreen({super.key, required this.user});

  @override
  State<BuyerTabScreen> createState() => _BuyerTabScreenState();
}

class _BuyerTabScreenState extends State<BuyerTabScreen> {
  String maintitle = "Buyer";
  List<Item> itemList = <Item>[];
  List<Item> displaylist = [];

  void searchList(String value) {
    setState(() {
      displaylist = itemList
          .where((element) =>
              element.itemName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void initializeDisplayList() {
    displaylist = List<Item>.from(itemList);
  }

  late double screenHeight, screenWidth;
  late int axiscount = 2;
  int numofpage = 1, curpage = 1;
  int numberofresult = 0;
  var color;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadItems(1);
    print("Buyer");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Daily Discover',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: itemList.isEmpty
          ? const Center(
              child: Text("No Data"),
            )
          : Column(children: [
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  onChanged: (value) => searchItem(value),
                  style: const TextStyle(color: Colors.orange, fontSize: 15),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                    hintText: "Wireless Keyboard...",
                    hintStyle: const TextStyle(color: Colors.orange),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
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
                                  onTap: () async {
                                    Item useritem =
                                        Item.fromJson(itemList[index].toJson());
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (content) =>
                                                BuyerDetailScreen(
                                                  useritem: useritem,
                                                )));
                                    loadItems(1);
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
                                          errorWidget: (context, url, error) =>
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
                              ));
                        },
                      ))),
              SizedBox(
                height: 35,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: numofpage,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if ((curpage - 1) == index) {
                        color = Colors.red;
                      } else {
                        color = Colors.green;
                      }
                      return TextButton(
                          onPressed: () {
                            curpage = index + 1;
                            loadItems(index + 1);
                            print('index: $index');
                          },
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: color, fontSize: 18),
                          ));
                    }),
              )
            ]),
    );
  }

  void loadItems(int pg) {
    http.post(Uri.parse("${ServerConfig.SERVER}/barter_it/php/load_items.php"),
        body: {"pageno": pg.toString()}).then((response) {
      //print(response.body);
      log(response.body);
      itemList.clear();
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        if (jsondata['status'] == "success") {
          numofpage = int.parse(jsondata['numofpage']);
          print("$numofpage page");
          numberofresult = int.parse(jsondata['numberofresult']);
          print(numberofresult);
          var extractdata = jsondata['data'];
          extractdata['items'].forEach((v) {
            itemList.add(Item.fromJson(v));
          });
          print(itemList[0].itemName);
        }
        setState(() {});
      }
    });
  }

  void searchItem(String search) {
    http.post(Uri.parse("${ServerConfig.SERVER}/barter_it/php/load_items.php"),
        body: {"search": search}).then((response) {
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
          print(itemList[0].itemName);
        }
        setState(() {});
      }
    });
  }
}
