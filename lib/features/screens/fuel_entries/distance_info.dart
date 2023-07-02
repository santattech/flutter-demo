import 'package:flutter/material.dart';

class DistanceInfo extends StatelessWidget {
  const DistanceInfo({
    super.key,
    required this.odometerValue,
  });
  final int odometerValue;

  @override
  Widget build(BuildContext context) {
    var formattedOdometerValue = '$odometerValue km';
    // var formattedBetweenDistance = '+$betweenDistance km';
    // print(formattedBetweenDistance);

    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(
        formattedOdometerValue,
        style: const TextStyle(
            color: Color.fromARGB(255, 24, 8, 69),
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5, top: 5),
        child: Text(
          "+140 km",
          style: const TextStyle(
              color: Color.fromARGB(255, 24, 8, 69),
              fontWeight: FontWeight.w100,
              fontSize: 12),
        ),
      ),
    ]);
  }
}
