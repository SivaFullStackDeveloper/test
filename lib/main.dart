import 'dart:io';
import 'package:a/controllers/loginController.dart';
import 'package:a/models/loginModel.dart';
import 'package:a/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Obx(()=>loginController.token.value == null?LoginPage():HomeScreen()),
    );
  }
}




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController();
  var password = TextEditingController();
  var message = TextEditingController();
  var loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child:Container()),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Padding(
              padding: const EdgeInsets.all(8.0),
              child:Text('Welcome',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        hintText: 'email',
                      ),
                    ),
                  ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:TextFormField(
                    controller: password,
                    decoration: const InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'password',
                    ),
                  ),),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      loginController
                          .login(email.text, password.text)
                          .then((value) {
                        var data = LoginData.fromJson(value);
                        prefs.setString('token', data.token);
                        Get.to(() => const HomeScreen());
                      });
                    },
                    child: const Text('login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
