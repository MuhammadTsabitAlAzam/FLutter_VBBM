import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Reusable_Components/formText.dart';
import 'package:vbbm/Screens/HomePage.dart';

import '../Models/user_models.dart';
import '../Reusable_Components/confirmationMessage.dart';
import '../api/user_api.dart';

class LoginScreenPage extends StatefulWidget {
  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ApiServiceUser _apiService = ApiServiceUser();
  late List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  void _loadUsers() async {
    try {
      final users = await _apiService.getUser();
      setState(() {
        _users = users;
      });
    } catch (e) {
      print("Error loading users: $e");
    }
  }

  void _loginProc() {
    final enteredUsername = usernameController.text;
    final enteredPassword = passwordController.text;

    // Validasi input pengguna
    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Username and password are required.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    User? matchedUser;

    for (var user in _users) {
      if (user.username == enteredUsername && user.password == enteredPassword) {
        matchedUser = user;
        break;
      }
    }

    if (matchedUser != null) {
      _login();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      SuccessMessage.showSuccessMessage(
          context,
          "Login Sukses",
          "Selamat, Anda berhasil Login !!!"
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: _height,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    landingTitle("Aplikasi Manajemen Kendaraan"),
                    SizedBox(height: 10),
                    landingSubTitle(
                      "Badan Penanggulangan Bencana Daerah (BPBD)\nDaerah Istimewa Yogyakarta",
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Image.asset(
                        'assets/images/bpbd.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    SizedBox(height: 30),
                    LoginTextField(
                      usernameController,
                      'Enter your username',
                      'Username',
                    ),
                    SizedBox(height: 20),
                    LoginTextField(
                      passwordController,
                      'Enter your password',
                      'Password',
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: _width - 40,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(220, 106, 0, 1),
                        ),
                        onPressed: () {_loginProc();},
                        child: regularWhiteText('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
