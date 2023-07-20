import 'dart:convert';
import 'dart:developer';
import 'package:barter_it/screens/loginregistersplashscreen.dart';
import 'package:barter_it/screens/loginscreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/item.dart';
import '../model/user.dart';
import '../myconfig.dart';
import 'buyercartscreen.dart';
import 'buyerdetailscreen.dart';
import 'buyerorderscreen.dart';
import 'buyersavedscreen.dart';
import 'package:google_fonts/google_fonts.dart';

//for buyer screen

class BuyerTabScreen extends StatefulWidget {
  final User user;

  const BuyerTabScreen({Key? key, required this.user}) : super(key: key);

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
  int cartqty = 0;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadItems();
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Daily Discover',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )),
        ),
        actions: [
          TextButton.icon(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            label: Text(cartqty.toString()), // Your text here
            onPressed: () async {
              if (cartqty > 0) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (content) => BuyerCartScreen(
                      user: widget.user,
                    ),
                  ),
                );
                loadItems();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("No item in cart")),
                );
              }
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("My Order"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("Saved"),
                ),
              ];
            },
            onSelected: (value) async {
              if (value == 0) {
                if (widget.user.id.toString() == "na") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please login/register an account"),
                    ),
                  );
                  return;
                }
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (content) => BuyerOrderScreen(
                      user: widget.user,
                    ),
                  ),
                );
              } else if (value == 1) {
                if (widget.user.id.toString() == "na") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please login/register an account"),
                    ),
                  );
                  return;
                }
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (content) => BuyerSavedScreen(
                      user: widget.user,
                    ),
                  ),
                );
              } else if (value == 2) {
                // Handle additional actions
              }
            },
          ),
        ],
      ),
      body: itemList.isEmpty
          ? const Center(
              child: Text("No Data"),
            )
          : Column(
              children: [
                const SizedBox(height: 10.0),
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
                const SizedBox(height: 10.0),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: axiscount,
                    childAspectRatio: 0.8,
                    children: itemList.map((item) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: Card(
                          elevation: 5,
                          child: InkWell(
                            onTap: () async {
                              if (widget.user.id == "na") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (content) =>
                                        const LoginRegisterSplashScreen(),
                                  ),
                                );
                                return;
                              } else {
                                Item useritem = Item.fromJson(item.toJson());
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (content) => BuyerDetailScreen(
                                      useritem: useritem,
                                      user: widget.user,
                                      page: curpage,
                                    ),
                                  ),
                                );
                              }
                              loadItems();
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 150,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              "${ServerConfig.SERVER}/barter_it/assets/photo/${item.itemId}_1.jpg",
                                          placeholder: (context, url) =>
                                              const LinearProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: IconButton(
                                          icon: Icon(
                                            item.isSaved
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: item.isSaved
                                                ? Colors.red
                                                : null,
                                          ),
                                          onPressed: () {
                                            if (widget.user.id == "na") {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (content) =>
                                                      const LoginRegisterSplashScreen(),
                                                ),
                                              );
                                              return;
                                            } else {
                                              final itemId = item.itemId;
                                              if (itemId != null) {
                                                toggleSaveStatus(itemId);
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Text(
                                    item.itemName.toString(),
                                    style: const TextStyle(fontSize: 20),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const SizedBox(height: 31),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Text(
                                        "RM${double.parse(item.itemPrice.toString()).toStringAsFixed(2)}",
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.red),
                                      ),
                                    ),
                                    Text(
                                      "${item.itemQty} available",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
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
                    return GestureDetector(
                        onTap: () {
                          curpage = index + 1;
                          loadItems();
                          print('index: $index');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0), 
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: color, fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  void loadItems() {
    http.post(
      Uri.parse("${ServerConfig.SERVER}/barter_it/php/load_items.php"),
      body: {
        "cartuserid": widget.user.id,
        "pageno": curpage.toString(),
      },
    ).then((response) {
      itemList.clear();
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        if (jsondata['status'] == "success") {
          numofpage = int.parse(jsondata['numofpage']);
          numberofresult = int.parse(jsondata['numberofresult']);
          var extractdata = jsondata['data'];
          cartqty = int.parse(jsondata['cartqty'].toString());
          extractdata['items'].forEach((v) {
            itemList.add(Item.fromJson(v));
          });
        }
        setState(() {});
      }
    });
  }

  void searchItem(String search) {
    http.post(
      Uri.parse("${ServerConfig.SERVER}/barter_it/php/load_items.php"),
      body: {"search": search},
    ).then((response) {
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

  void toggleSaveStatus(String itemId) async {
    Item? item;
    int index = -1;

    for (var i = 0; i < itemList.length; i++) {
      if (itemList[i].itemId == itemId) {
        item = itemList[i];
        index = i;
        break;
      }
    }

    if (item == null || index == -1) {
      return;
    }

    item.isSaved = !item.isSaved;

    final response = await http.post(
      Uri.parse("${ServerConfig.SERVER}/barter_it/php/toggle_save_status.php"),
      body: {
        "userId": widget.user.id,
        "itemId": item.itemId!,
        "isSaved": item.isSaved ? "1" : "0",
      },
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == "success") {
        // Item status updated successfully
        if (!item.isSaved) {
          // Remove the item from the saved page
          itemList.removeAt(index);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Item removed from saved page")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Item saved successfully")),
          );
        }
      } else {
        // Error occurred while updating item status
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update item status")),
        );
        // Revert the saved status if an error occurred
        item.isSaved = !item.isSaved;
      }
    } else {
      // Error occurred while making the API call
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to communicate with the server")),
      );
      // Revert the saved status if an error occurred
      item.isSaved = !item.isSaved;
    }

    // Update the itemList with the modified item
    setState(() {
      itemList[index] = item!;
    });
  }
}
