import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FuelEntryElement extends ConsumerStatefulWidget {
  const FuelEntryElement({Key? key}) : super(key: key);

  @override
  ConsumerState<FuelEntryElement> createState() => _FuelEntryElement();
}

class _FuelEntryElement extends ConsumerState<FuelEntryElement> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          const Icon(Icons.oil_barrel, color: Color.fromARGB(238, 53, 61, 50)),
      title: const Text("fillingDate.toString()",
          style: const TextStyle(color: Color.fromARGB(255, 24, 8, 69))),
      subtitle: Column(
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
      ),
      trailing:
          const Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
      ]),
    );
  }
}
