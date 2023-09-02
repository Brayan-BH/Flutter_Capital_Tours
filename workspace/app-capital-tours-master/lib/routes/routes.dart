import 'package:app_capital_tours/pages/historial.page.dart';
import 'package:app_capital_tours/pages/home.page.dart';
import 'package:app_capital_tours/pages/login.page.dart';
import 'package:app_capital_tours/pages/pasajeros.map.pages.dart';
import 'package:app_capital_tours/pages/splash.dart';
import 'package:app_capital_tours/pages/welcome.page.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage<dynamic>>? get() {
    return [
      GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(
        name: '/login',
        page: () => const LoginPage(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: '/welcome',
        page: () => const WelcomePage(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: '/home',
        page: () => const HomePage(),
        transition: Transition.fadeIn,
      ),
      GetPage(name: '/home/history', page: () => const HistorialPage()),
      GetPage(name: '/home/pasajeros-map', page: () => const PasajerosMapPage())
    ];
  }
}
