import 'package:cities/views/city/widgets/city.dart';
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
      home: City(),
    );
  }
}
