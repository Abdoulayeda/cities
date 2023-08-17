import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip.model.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Tryp myTryp;
  final String cityName;

  double get amount => 0;
  const TripOverview(
      {super.key,
      required this.setDate,
      required this.myTryp,
      required this.cityName});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width:
          orientation == Orientation.landscape ? size.width * 0.4 : size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 22,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  DateFormat("d/M/y").format(myTryp.date),
                ),
              ),
              ElevatedButton(
                onPressed: setDate,
                child: const Text('Selectionnez une date'),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(children: [
            const Expanded(
              child: Text('Montant / Personne'),
            ),
            Text(
              '$amount',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(' Euro')
          ])
        ],
      ),
    );
  }
}
