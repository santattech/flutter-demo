import 'package:flutter/material.dart';

class FuelCardSubtitle extends StatelessWidget {
  const FuelCardSubtitle({
    super.key,
    required this.quantity,
    required this.cost,
    required this.totalPrice,
  });

  final String quantity;
  final String cost;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    var formattedQuantity = '$quantity ltr';
    var formattedPrice = '$cost/ ltr';

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.currency_rupee_rounded,
                    size: 20.0, color: Color.fromARGB(255, 98, 56, 53)),
                Text(
                  totalPrice,
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
              formattedQuantity,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
            Text(
              formattedPrice,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            )
          ],
        ),
      ],
    );
  }
}
