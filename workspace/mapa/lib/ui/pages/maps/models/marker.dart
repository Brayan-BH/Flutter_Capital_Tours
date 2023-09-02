import 'package:latlong2/latlong.dart';

class MapMarker {
  final String? image;
  final String? driver;
  final String? address;
  final LatLng? location;
  final int? rating;

  MapMarker({
    required this.image,
    required this.driver,
    required this.address,
    required this.location,
    required this.rating,
  });
}

final mapMarkers = [
  MapMarker(
      image: 'assets/images/person.jpeg',
      driver: 'Jesus Ramos Torres',
      address: 'Jr Ica 567',
      location: LatLng(-12.0711559, -75.2104706),
      rating: 4),
  MapMarker(
      image: 'assets/images/person.jpeg',
      driver: 'Pedro Ataucusi Quispe',
      address: 'Pasaje Andaluz',
      location: LatLng(-12.0708635, -75.2063868),
      rating: 5),
  MapMarker(
      image: 'assets/images/person.jpeg',
      driver: 'Mario Ramos Poma',
      address: 'Av Girladez 675',
      location: LatLng(-12.065202, -75.206015),
      rating: 2),
  MapMarker(
      image: 'assets/images/person.jpeg',
      driver: 'Miguel Huaman Aomayta',
      address: 'Ah Milagros de Jesus',
      location: LatLng(-12.0628176, -75.2216034),
      rating: 3),
  MapMarker(
    image: 'assets/images/person.jpeg',
    driver: 'Cristian Marquez Paulino',
    address: 'Colegio Nacional Santa Isabel de Huancayo',
    location: LatLng(-12.0719087, -75.2141798),
    rating: 4,
  ),
  MapMarker(
    image: 'assets/images/person.jpeg',
    driver: 'Jesus Asto Paredes',
    address: 'Jr. Libertad 416, Huancayo 12001',
    location: LatLng(-12.0694183, -75.2154491),
    rating: 4,
  ),
];