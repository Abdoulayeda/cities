import 'package:cities/views/city/widgets/activity_card.dart';
import 'package:flutter/material.dart';

import '../../../models/activity.model.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final List<String> selectedActivities;
  final Function toogleActivity;

  const ActivityList(
      {super.key,
      required this.activities,
      required this.selectedActivities,
      required this.toogleActivity});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(5),
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: activities
          .map(
            (activity) => ActivityCard(
              activity: activity,
              isSelected: selectedActivities.contains(activity.id),
              toogleActivity: () => toogleActivity(activity.id),
            ),
          )
          .toList(),
    );
  }
}
