import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../myconfig.dart';
import 'loginscreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passEditingController = TextEditingController();
  final TextEditingController _pass2EditingController = TextEditingController();
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  late double screenHeight, screenWidth, cardwitdh;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.35,
                width: screenWidth * 2.50,
                child: Image.asset(
                  'assets/images/trade1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(0),
                  child: Card(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 30, 16, 100),
                        child: Column(
                          children: [
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Please register to continue',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: _nameEditingController,
                                      validator: (val) => val!.isEmpty ||
                                              (val.length < 5)
                                          ? "name must be longer than 5 characters"
                                          : null,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                        labelText: 'Name',
                                        labelStyle: TextStyle(),
                                        icon: Icon(Icons.person),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 2.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _phoneEditingController,
                                      validator: (val) => val!.isEmpty ||
                                              (val.length < 10)
                                          ? "phone must be longer or equal to 10"
                                          : null,
                                      keyboardType: TextInputType.phone,
                                      decoration: const InputDecoration(
                                          labelText: 'Phone',
                                          labelStyle: TextStyle(),
                                          icon: Icon(Icons.phone),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 2.0),
                                          )),
                                    ),
                                    TextFormField(
                                      controller: _emailEditingController,
                                      validator: (val) => val!.isEmpty ||
                                              !val.contains('@') ||
                                              !val.contains('.')
                                          ? "enter a valid email"
                                          : null,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(),
                                        icon: Icon(Icons.email),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 2.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _passEditingController,
                                      validator: (val) =>
                                          val!.isEmpty || (val.length < 5)
                                              ? "password must be longer than 5"
                                              : null,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: TextStyle(),
                                        icon: Icon(Icons.lock),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 2.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _pass2EditingController,
                                      validator: (val) =>
                                          val!.isEmpty || (val.length < 5)
                                              ? "password must be longer than 5"
                                              : null,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          labelText: 'Re-enter Password',
                                          labelStyle: TextStyle(),
                                          icon: Icon(Icons.lock),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 2.0),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Checkbox(
                                          value: _isChecked,
                                          onChanged: (bool? value) {
                                            if (!_isChecked) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          "Terms have been read and accepted.")));
                                            }
                                            setState(() {
                                              _isChecked = value!;
                                            });
                                          }),
                                      GestureDetector(
                                        onTap: null,
                                        child: const Text(
                                          'Agree with terms',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                        minWidth: screenWidth / 3,
                                        height: 50,
                                        elevation: 10,
                                        onPressed: onRegisterDialog,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        textColor: Theme.of(context)
                                            .colorScheme
                                            .onError,
                                        child: const Text('Register'),
                                      ),
                                    ]),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Already registered? ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        GestureDetector(
                                          onTap: _goLogin,
                                          child: const Text(
                                            "Login now",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        )),
                  ))
            ],
          )),
    );
  }

  void onRegisterDialog() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Check your input')));
      return;
    }
    if (!_isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please agree with the terms and conditions')));
      return;
    }

    String passa = _passEditingController.text;
    String passb = _pass2EditingController.text;
    if (passa != passb) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: const Text(
              'Register new account?',
              style: TextStyle(),
            ),
            content: const Text(
              'Are you sure?',
              style: TextStyle(),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _registerUser();
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(),
                  )),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              )
            ],
          );
        });
  }

  void _registerUser() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Please Wait"),
          content: Text("Registration..."),
        );
      },
    );
    String name = _nameEditingController.text;
    String phone = _phoneEditingController.text;
    String email = _emailEditingController.text;
    String passa = _passEditingController.text;
    http.post(
        Uri.parse("${ServerConfig.SERVER}/barter_it/php/register_user.php"),
        body: {
          "name": name,
          "phone": phone,
          "email": email,
          "password": passa,
        }).then((response) {
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registration Success")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Registration Failed")));
      }
      Navigator.pop(context);
    });
  }

  void _goLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen()));
  }
}
