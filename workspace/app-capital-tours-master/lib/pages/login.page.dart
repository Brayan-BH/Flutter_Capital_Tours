import 'package:app_capital_tours/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:localstore/localstore.dart';
import 'package:http/http.dart' as http;

import '../library/api.library.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heigthScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Container(
            width: widthScreen,
            height:
                heigthScreen >= 650 ? heigthScreen - 300 : heigthScreen - 350,
            decoration: const BoxDecoration(
              color: defaultColorApp,
            ),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 60, top: heigthScreen >= 668 ? 75 : 20),
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      elevation: 20,
                      child: Image.asset('assets/images/logo.png', width: 150),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: heigthScreen * 0.35,
            left: widthScreen * 0.05,
            right: widthScreen * 0.05,
            child: Column(
              children: [
                Material(
                  elevation: 20,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: widthScreen - 40,
                    height: widthScreen >= 800
                        ? 700
                        : heigthScreen >= 650
                            ? 335
                            : 320,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Iniciar Sesión',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: defaultColorApp2,
                                    borderRadius: BorderRadius.circular(20),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 30),
                                child: TextFormField(
                                  controller: _userController,
                                  validator: (value) {
                                    return (value != null && value.isEmpty
                                        ? 'Por favor ingrese un valor'
                                        : null);
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'usuario',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey.shade300,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 49,
                                child: TextFormField(
                                  controller: _passwordController,
                                  validator: (value) {
                                    return (value != null && value.isEmpty
                                        ? 'Por favor ingrese un valor'
                                        : null);
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Contraseña',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey.shade300,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextButton(
                                  onPressed: () {
                                    initLogin();
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: defaultColorApp2,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: widthScreen >= 300 ? 50 : 20,
                                    ),
                                    child: const Text(
                                      'Iniciar Sesión',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.transparent,
              )
            ],
          ),
        ],
      ),
    );
  }

  void initLogin() {
    // if (_userController.text == "" || _passwordController.text == "") {
    //   Fluttertoast.showToast(
    //       msg: 'Todos los campos son obligatorios',
    //       toastLength: Toast.LENGTH_LONG,
    //       backgroundColor: Colors.yellow,
    //       textColor: Colors.grey.shade600);
    // } else {
    //   var data = {
    //     "users": _userController.text.trim(),
    //     "password": _passwordController.text,
    //   };
    //   Apiv2()
    //       .exec("auth-cliente/login", data: data, method: "PUT", auth: false)
    //       .then((response) {
    //     if (response.isNotEmpty) {
    //       final db = Localstore.instance;
    //       db.collection("session").doc("init").set(response);
    //       Get.toNamed('/welcome');
    //     }
    //   });
    // }
    Get.toNamed('/welcome');
  }
}
