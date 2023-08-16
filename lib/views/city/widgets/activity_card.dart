import 'package:cities/models/activity.model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isSelected;
  final VoidCallback toogleActivity;

  const ActivityCard(
      {super.key,
      required this.activity,
      required this.isSelected,
      required this.toogleActivity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Ink.image(
            fit: BoxFit.cover,
            image: AssetImage(activity.image),
            child: InkWell(
              onTap: toogleActivity,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (isSelected)
                        const Icon(
                          Icons.check,
                          size: 40,
                          color: Colors.white,
                        ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          activity.name,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}