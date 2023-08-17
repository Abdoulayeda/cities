import 'package:cities/views/404/not_found.dart';
import 'package:cities/views/city/widgets/city_view.dart';
import 'package:cities/views/home/home_view.dart';
import 'package:flutter/material.dart';
//import 'views/home/home.dart';

void main() {
  runApp(const DymaTrip());
}

class DymaTrip extends StatelessWidget {
  const DymaTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.routeName,
      routes: {
        HomeView.routeName: (context) => const HomeView(),
        CityView.routeName: (context) => CityView(),
      },
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: ((context) => const NotFound()));
      }),
    );
  }
}
