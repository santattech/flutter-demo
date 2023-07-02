import 'package:flutter/material.dart';

class FuelCardTitle extends StatelessWidget {
  const FuelCardTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(color: Color.fromARGB(255, 24, 8, 69)));
  }
}
