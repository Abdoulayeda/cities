import 'package:flutter/material.dart';

import '../../../models/activity.model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  const TripActivityList({
    super.key,
    required this.activities,
    required this.deleteTripActivity,
  });

  @override
  Widget build(BuildContext context) {
    return activities.isEmpty
        ? const Center(
            child: Text(
              "Vous avez pas d'activités prévu!",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              var activity = activities[index];
              return Card(
                child: ListTile(
                  visualDensity:
                      const VisualDensity(vertical: 2.0, horizontal: 4.0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(activity.image),
                  ),
                  title: Text(
                    activity.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () => deleteTripActivity(activity.id),
                  ),
                ),
              );
            },
            itemCount: activities.length,
          );
  }
}
