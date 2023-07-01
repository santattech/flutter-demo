import 'package:flutter/material.dart';

class FuelCardSubtitle extends StatelessWidget {
  const FuelCardSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.currency_rupee_rounded,
                    size: 20.0, color: Color.fromARGB(255, 98, 56, 53)),
                Text(
                  '848.00',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                )
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.water_drop,
                size: 16.0, color: Color.fromARGB(255, 108, 4, 118)),
            Text(
              '8 ltr',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
            Text(
              '105.00/ ltr',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            )
          ],
        ),
      ],
    );
  }
}
