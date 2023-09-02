import 'package:app_capital_tours/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HistorialPage extends StatefulWidget {
  const HistorialPage({super.key});

  @override
  State<HistorialPage> createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  List<dynamic> items = [
    '1 de Mayo 143-109, Huancayo 12001',
    'Jr. Libertad 492, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
    'Av. San Carlos 306-398, Huancayo 12001',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de pings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.toNamed('/home'),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: defaultColorApp,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onLongPress: () => deleteHistory(index),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: defaultColorApp2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.adjust, color: defaultColorApp),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Mi ubicacion reciente',
                              style: TextStyle(
                                color: defaultColorApp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: defaultColorApp.withOpacity(0.3),
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person_pin_circle,
                            color: Color(0xfff52d56),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                items[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: items.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  void deleteHistory(index) {
    Get.defaultDialog(
      title: '¿Borrar ubicación reciente?',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              items.removeAt(index);
              setState(() {
                items;
              });
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: defaultColorApp2,
            ),
            child: const Text('Confirmar'),
          ),
          ElevatedButton(
            onPressed: () => Get.back(),
            style: ElevatedButton.styleFrom(
              backgroundColor: defaultColorApp,
            ),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }
}
