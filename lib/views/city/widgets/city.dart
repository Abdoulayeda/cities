import 'package:cities/models/trip.model.dart';
import 'package:cities/views/city/widgets/activity_list.dart';
import 'package:cities/views/city/widgets/trip_activity_list.dart';
import 'package:cities/views/city/widgets/trip_overview.dart';
import 'package:flutter/material.dart';
import '../../../data/data.dart' as data;
import '../../../models/activity.model.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  late int index;
  late Tryp myTryp;

  @override
  void initState() {
    super.initState();
    myTryp = Tryp(city: 'Paris', activities: [], date: DateTime.now());

    index = 0;
  }

  void setDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2025),
    ).then((newDate) => {
          if (newDate != null)
            {
              setState(
                () {
                  myTryp.date = newDate;
                },
              )
            }
        });
  }

  void swichIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toogleActivity(String id) {
    setState(() {
      myTryp.activities.contains(id)
          ? myTryp.activities.remove(id)
          : myTryp.activities.add(id);
    });
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => myTryp.activities.contains(activity.id))
        .toList();
  }

  void deleteTripActivity(String id) {
    setState(() {
      myTryp.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text('Organisation du voyage'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          TripOverview(
            setDate: setDate,
            myTryp: myTryp,
          ),
          Expanded(
            child: index == 0
                ? ActivityList(
                    activities: widget.activities,
                    selectedActivities: myTryp.activities,
                    toogleActivity: toogleActivity,
                  )
                : TripActivityList(
                    activities: tripActivities,
                    deleteTripActivity: deleteTripActivity,
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 18, 3, 61),
        unselectedItemColor: const Color.fromARGB(255, 225, 229, 238),
        selectedLabelStyle: const TextStyle(fontSize: 17),
        unselectedLabelStyle: const TextStyle(fontSize: 17, letterSpacing: 2),
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: 25,
            ),
            label: 'Decouverte',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stars,
              size: 25,
            ),
            label: 'Mes activités',
          ),
        ],
        onTap: swichIndex,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
