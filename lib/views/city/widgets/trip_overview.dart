import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip.model.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Tryp myTryp;

  double get amount => 0;
  const TripOverview({super.key, required this.setDate, required this.myTryp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Paris',
            style: TextStyle(
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
