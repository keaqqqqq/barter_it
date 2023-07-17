import 'dart:convert';
import 'package:barter_it/model/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/item.dart';
import 'package:http/http.dart' as http;
import '../myconfig.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

import 'buyermorescreen.dart';

class BuyerDetailScreen extends StatefulWidget {
  final Item useritem;
  final User user;

  const BuyerDetailScreen(
      {super.key,
      required this.useritem,
      required this.user,
      required int page});

  @override
  State<BuyerDetailScreen> createState() => _BuyerDetailScreenState();
}

class _BuyerDetailScreenState extends State<BuyerDetailScreen> {
  int qty = 0;
  int userqty = 1;
  double totalprice = 0.0;
  double singleprice = 0.0;

  @override
  void initState() {
    super.initState();
    qty = int.parse(widget.useritem.itemQty.toString());
    totalprice = double.parse(widget.useritem.itemPrice.toString());
    singleprice = double.parse(widget.useritem.itemPrice.toString());
  }

  final df = DateFormat('dd-MM-yyyy hh:mm a');

  late double screenHeight, screenWidth, cardwitdh;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(230),
        // Adjust the preferred height
        child: AppBar(
          centerTitle: true,
          flexibleSpace: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Align(
              alignment: Alignment.center,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return CachedNetworkImage(
                    imageUrl:
                        "${ServerConfig.SERVER}/barter_it/assets/photo/${widget.useritem.itemId}_${index + 1}.jpg",
                    fit: BoxFit.cover,
                  );
                },
                itemCount: 3, // Replace with the actual number of images
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (content) => BuyerMoreScreen(
                      user: widget.user,
                      useritem: widget.useritem,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.more_horiz_outlined),
              tooltip: "More from this seller",
            ),
          ],
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              widget.useritem.itemName.toString(),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(7),
              },
              children: [
                TableRow(children: [
                  const TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.useritem.itemDesc.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ]),
                TableRow(children: [
                  const TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Type",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.useritem.itemType.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ]),
                TableRow(children: [
                  const TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Quantity",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.useritem.itemQty.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ]),
                TableRow(children: [
                  const TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "RM ${double.parse(widget.useritem.itemPrice.toString()).toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ]),
                TableRow(children: [
                  const TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${widget.useritem.itemLocality}/${widget.useritem.itemState}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.orange, width: 2.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      if (userqty <= 1) {
                        userqty = 1;
                        totalprice = singleprice * userqty;
                      } else {
                        userqty = userqty - 1;
                        totalprice = singleprice * userqty;
                      }
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    userqty.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      if (userqty >= qty) {
                        userqty = qty;
                        totalprice = singleprice * userqty;
                      } else {
                        userqty = userqty + 1;
                        totalprice = singleprice * userqty;
                      }
                      setState(() {});
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.fromLTRB(30, 15, 30, 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.orange),
                    ))),
                onPressed: () {
                  addtocartdialog();
                },
                child: Text(
                  "RM ${totalprice.toStringAsFixed(2)} Add to Cart",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  void addtocartdialog() {
    if (widget.user.id.toString() == "na") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please register to add item to cart")));
      return;
    }
    if (widget.user.id.toString() == widget.useritem.userId.toString()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User cannot add own item")));
      return;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: const Text(
            "Add to cart?",
            style: TextStyle(),
          ),
          content: const Text("Are you sure?", style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                addtocart();
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

  void addtocart() {
    http.post(Uri.parse("${ServerConfig.SERVER}/barter_it/php/addtocart.php"),
        body: {
          "item_id": widget.useritem.itemId.toString(),
          "cart_qty": userqty.toString(),
          "cart_price": totalprice.toString(),
          "userid": widget.user.id,
          "sellerid": widget.useritem.userId
        }).then((response) {
      // ignore: avoid_print
      print(response.body);
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        if (jsondata['status'] == 'success') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Success")));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Failed")));
        }
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed")));
        Navigator.pop(context);
      }
    });
  }
}
