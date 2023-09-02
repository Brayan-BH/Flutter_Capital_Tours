import 'package:app_capital_tours/constants.dart';
import 'package:app_capital_tours/pages/map/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasajerosMapPage extends StatefulWidget {
  const PasajerosMapPage({super.key});

  @override
  State<PasajerosMapPage> createState() => _PasajerosMapPageState();
}

class _PasajerosMapPageState extends State<PasajerosMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: defaultColorApp,
        title: const Text('Pasajeros cercanos'),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: PageMap(),
      // bottomNavigationBar: Align(
      //   alignment: Alignment.topCenter,
      //   child: Container(
      //     margin: const EdgeInsets.only(top: 80),
      //     width: MediaQuery.of(context).size.width - 20,
      //     height: 50,
      //     decoration: BoxDecoration(
      //       color: defaultColorApp,
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 10),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           IconButton(
      //             onPressed: () {
      //               Get.back();
      //             },
      //             icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
      //           ),
      //           const Text(
      //             'Ver pasajeros cerca',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           const Icon(Icons.close_rounded, color: Colors.grey)
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
