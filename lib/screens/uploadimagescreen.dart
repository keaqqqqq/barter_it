import 'dart:convert';
import 'dart:io';
import 'package:barter_it/screens/newitemscreen.dart';
import 'package:http/http.dart' as http;
import 'package:barter_it/model/user.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../myconfig.dart';
import 'newitemsplashscreen.dart';

class UploadImageScreen extends StatefulWidget {
  final User user;

  const UploadImageScreen({Key? key, required this.user});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? _image;
  File? _image1;
  File? _image2;
  var pathAsset = "assets/images/placeholder.png";
  late double screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Ta-da! How does it look?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: GestureDetector(
                onTap: () {
                  _chooseImageOption();
                },
                child: SizedBox(
                  height: 180,
                  width: 250,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      Image(
                        image: _image == null
                            ? AssetImage(pathAsset)
                            : FileImage(_image!) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              'First view',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: GestureDetector(
                onTap: () {
                  _chooseImageOption1();
                },
                child: SizedBox(
                  height: 180,
                  width: 250,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      Image(
                        image: _image1 == null
                            ? AssetImage(pathAsset)
                            : FileImage(_image1!) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              'Second view',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: GestureDetector(
                onTap: () {
                  _chooseImageOption2();
                },
                child: SizedBox(
                  height: 180,
                  width: 250,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      Image(
                        image: _image2 == null
                            ? AssetImage(pathAsset)
                            : FileImage(_image2!) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              'Third view',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      insertDialog();
                    },
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(130, 15, 130, 15),
                      child: Text('Next',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _chooseImageOption() async {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            title: const Text('Select Photo'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  _selectFromCamera();
                },
                child: const Text('Camera'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _selectFromGallery();
                },
                child: const Text('Gallery'),
              ),
            ],
          );
        });
  }

  Future<void> _chooseImageOption1() async {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            title: const Text('Select Photo'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  _selectFromCamera1();
                },
                child: const Text('Camera'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _selectFromGallery1();
                },
                child: const Text('Gallery'),
              ),
            ],
          );
        });
  }

  Future<void> _chooseImageOption2() async {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            title: const Text('Select Photo'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  _selectFromCamera2();
                },
                child: const Text('Camera'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _selectFromGallery2();
                },
                child: const Text('Gallery'),
              ),
            ],
          );
        });
  }

  Future<void> _selectFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1200,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      cropImage();
    } else {}
  }

  Future<void> _selectFromCamera1() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1200,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      _image1 = File(pickedFile.path);
      cropImage1();
    } else {}
  }

  Future<void> _selectFromCamera2() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1200,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      _image2 = File(pickedFile.path);
      cropImage2();
    } else {}
  }

  Future<void> _selectFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1200,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      cropImage();
    } else {}
  }

  Future<void> _selectFromGallery1() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1200,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      _image1 = File(pickedFile.path);
      cropImage1();
    } else {}
  }

  Future<void> _selectFromGallery2() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1200,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      _image2 = File(pickedFile.path);
      cropImage2();
    } else {}
  }

  Future<void> cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: _image!.path,
      aspectRatioPresets: [
        // CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.original,
        //CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.orange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.ratio3x2,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      File imageFile = File(croppedFile.path);
      _image = imageFile;
      Navigator.pop(context);
      int? sizeInBytes = _image?.lengthSync();
      double sizeInMb = sizeInBytes! / (1024 * 1024);

      setState(() {});
    }
  }

  Future<void> cropImage1() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: _image1!.path,
      aspectRatioPresets: [
        // CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.original,
        //CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.orange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.ratio3x2,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      File imageFile = File(croppedFile.path);
      _image1 = imageFile;
      Navigator.pop(context);
      int? sizeInBytes = _image1?.lengthSync();
      double sizeInMb = sizeInBytes! / (1024 * 1024);

      setState(() {});
    }
  }

  Future<void> cropImage2() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: _image2!.path,
      aspectRatioPresets: [
        // CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.original,
        //CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.orange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.ratio3x2,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      File imageFile = File(croppedFile.path);
      _image2 = imageFile;
      Navigator.pop(context);
      int? sizeInBytes = _image2?.lengthSync();
      double sizeInMb = sizeInBytes! / (1024 * 1024);

      setState(() {});
    }
  }

  void insertDialog() {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please take a picture for first view')));
      return;
    }
    if (_image1 == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please take a picture for second view')));
      return;
    }
    if (_image2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please take a picture for third view')));
      return;
    }
    insertCatch();
  }

  void insertCatch() {
    String base64Image = base64Encode(_image!.readAsBytesSync());
    String base64Image1 = base64Encode(_image1!.readAsBytesSync());
    String base64Image2 = base64Encode(_image2!.readAsBytesSync());

    http.post(Uri.parse("${Config.server}/barter_it/php/insert_items.php"),
        body: {
          "userid": widget.user.id.toString(),
          "image": base64Image,
          "image1": base64Image1,
          "image2": base64Image2,
        }).then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        if (jsondata['status'] == 'success') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Insert Success")));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NewItemScreen(
                user: widget.user,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Insert Failed")));
          Navigator.pop(context);
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Insert Failed")));
        Navigator.pop(context);
      }
    });
  }
}
