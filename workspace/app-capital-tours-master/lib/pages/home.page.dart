import 'package:app_capital_tours/components/sidebar.dart';
import 'package:app_capital_tours/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: defaultColorApp,
        elevation: 0,
      ),
      backgroundColor: defaultColorApp,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/carLogo.png',
                  width: 300,
                ),
              ),
              const Text(
                '¡Hola, encantado de conocerte!',
                style: TextStyle(fontSize: 30, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: defaultColorApp,
                    side: const BorderSide(
                      width: 2,
                      color: defaultColorApp2,
                    ),
                  ),
                  onPressed: () => Get.toNamed('/home/pasajeros-map'),
                  icon: const Icon(
                    Icons.place,
                    color: defaultColorApp2,
                  ),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      'Ver pasajeros cercanos',
                      style: TextStyle(color: defaultColorApp2, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: defaultColorApp,
                    side: const BorderSide(
                      width: 2,
                      color: defaultColorApp2,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.back_hand,
                    color: defaultColorApp2,
                  ),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Text(
                      'Solicitar TAXI',
                      style: TextStyle(color: defaultColorApp2, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
