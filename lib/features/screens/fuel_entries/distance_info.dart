import 'package:flutter/material.dart';

class DistanceInfo extends StatelessWidget {
  const DistanceInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(
        '6072 km',
        style: TextStyle(
            color: Color.fromARGB(255, 24, 8, 69),
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
      Padding(
        padding: EdgeInsets.only(right: 5, top: 5),
        child: Text(
          '+140 km',
          style: TextStyle(
              color: Color.fromARGB(255, 24, 8, 69),
              fontWeight: FontWeight.w100,
              fontSize: 12),
        ),
      ),
    ]);
  }
}
