import 'package:flutter/material.dart';

class FuelCardTitle extends StatelessWidget {
  const FuelCardTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("fillingDate.toString()",
        style: const TextStyle(color: Color.fromARGB(255, 24, 8, 69)));
  }
}
