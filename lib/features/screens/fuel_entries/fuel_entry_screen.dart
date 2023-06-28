import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FuelEntryScreen extends ConsumerStatefulWidget {
  const FuelEntryScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<FuelEntryScreen> createState() => _FuelEntryScreen();
}

class _FuelEntryScreen extends ConsumerState<FuelEntryScreen> {
  final ButtonStyle buttonStyle =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mileage log'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                    height: 150,
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      shadowColor: Colors.purpleAccent,
                      child: ListTile(
                        leading: const Icon(Icons.oil_barrel,
                            color: Color.fromARGB(238, 53, 61, 50)),
                        title: const Text('2023-04-04',
                            style: TextStyle(
                                color: Color.fromARGB(255, 24, 8, 69))),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.currency_rupee_rounded,
                                        size: 20.0,
                                        color: Color.fromARGB(255, 98, 56, 53)),
                                    Text(
                                      '848.00',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    )
                                  ],
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.water_drop,
                                    size: 16.0,
                                    color: Color.fromARGB(255, 108, 4, 118)),
                                Text(
                                  '8 ltr',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(
                                  '105.00/ ltr',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                )
                              ],
                            ),
                          ],
                        ),
                        trailing: const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
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
                      ),
                    )));
          }
          // ,
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
          //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
          //   ),
          // ),
          // ButtonBar(
          //   alignment: MainAxisAlignment.start,
          //   children: [
          //     ElevatedButton(
          //       child: Text(
          //         'Click Me',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       onPressed: () {},
          //     ),
          //     ElevatedButton(
          //       child: Text(
          //         'Click Me',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       onPressed: () {},
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
