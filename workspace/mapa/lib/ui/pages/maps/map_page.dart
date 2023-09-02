import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapa/ui/pages/maps/models/marker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../widgets/constants.dart';

class PageMap extends StatefulWidget {
  const PageMap({Key? key}) : super(key: key);

  @override
  State<PageMap> createState() => _PageMapState();
}

class _PageMapState extends State<PageMap> with TickerProviderStateMixin {
  final pageController = PageController();
  int selectedIndex = 0;
  var currentLocation = AppConstants.myLocation;

  late final MapController mapController;
  late Position currentPosition;
  LatLng defaultLatLng = const LatLng(-12.06513, -75.20486);
  LatLng point = const LatLng(-12.06513, -75.20486);
  var location = [];

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    final PermissionStatus status = await Permission.location.request();
    if (status == PermissionStatus.denied) {
      Fluttertoast.showToast(
        msg: 'Permission denied',
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
    } else {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );
      double lat = double.parse(position.latitude.toStringAsFixed(6));
      double lon = double.parse(position.longitude.toStringAsFixed(6));

      setState(() {
        point = LatLng(lat, lon);
        mapController.move(point, mapController.zoom);
      });

      print('Latitude: $lat Longitude: $lon');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 16,
              center: currentLocation,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/brayandevs/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
                additionalOptions: const {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              MarkerLayer(
                markers: [
                  for (int i = 0; i < mapMarkers.length; i++)
                    Marker(
                      height: 40,
                      width: 40,
                      point: mapMarkers[i].location ?? AppConstants.myLocation,
                      builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            pageController.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            selectedIndex = i;
                            _animatedMapMove(
                              mapMarkers[i].location ?? AppConstants.myLocation,
                              mapController.zoom,
                            ); // Cambio aquí
                            setState(() {});
                          },
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 500),
                            scale: selectedIndex == i ? 1 : 0.7,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: selectedIndex == i ? 1 : 0.5,
                              child: SvgPicture.asset(
                                'assets/icons/map-marker.svg',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                selectedIndex = value;
                currentLocation = mapMarkers[value].location ?? AppConstants.myLocation;
                _animatedMapMove(currentLocation, 11.5);
                setState(() {});
              },
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: item.rating,
                                  itemBuilder: (BuildContext context, int index) {
                                    return const Icon(
                                      Icons.circle,
                                      color: Colors.green,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.driver ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      item.address ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.image ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          // Centrar el mapa en la ubicación actual
          _animatedMapMove(AppConstants.myLocation, mapController.zoom);
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    final latTween =
        Tween<double>(begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween =
        Tween<double>(begin: mapController.center.longitude, end: destLocation.longitude);

    // Solo animamos el centro del mapa, no el zoom.
    var controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    Animation<double> animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        mapController.zoom, // Mantenemos el zoom constante
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}