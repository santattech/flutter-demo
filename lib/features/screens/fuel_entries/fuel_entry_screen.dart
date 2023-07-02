import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'dart:core';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningdart/features/screens/fuel_entries/distance_info.dart';
import 'package:learningdart/features/screens/fuel_entries/fuel_card_subtitle.dart';
import 'package:learningdart/features/screens/fuel_entries/fuel_card_title.dart';
import 'package:learningdart/model/fuel_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class FuelEntryScreen extends ConsumerStatefulWidget {
  const FuelEntryScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<FuelEntryScreen> createState() => _FuelEntryScreen();
}

Future<String> _loadFuelLogs() async {
  return await rootBundle.loadString('assets/fuelLog.json');
}

Future<FuelModel> getFuelLogs() async {
  String jsonFuelData = await _loadFuelLogs();

  print(parseResponseBody(jsonFuelData));
  return FuelModel.fromJson(parseResponseBody(jsonFuelData));
}

Map<String, dynamic> parseResponseBody(response) {
  if (true) {
    return jsonDecode(response) as Map<String, dynamic>;
  } else if (response.statusCode == 404) {
    throw Exception('Wrong creds');
  } else if (response.statusCode == 401) {
    throw Exception('Unauthorize');
  } else {
    throw Exception('Something went wrong');
  }
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
      body: FutureBuilder<FuelModel>(
          future: getFuelLogs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(
                      color: Color.fromARGB(255, 38, 103, 55), fontSize: 20),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return const Center(
                  child: Text(
                    'Something went wrong, please try again',
                    style: TextStyle(
                        color: Color.fromARGB(255, 24, 8, 69), fontSize: 16),
                  ),
                );
              } else if (snapshot.hasData) {
                final fuelData = snapshot.data;
                var listOfItems = fuelData?.data as List;
                int itemCount = listOfItems.length;
                if (fuelData?.data != null) {
                  print(fuelData?.data.length);
                }

                return ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Container(
                              height: 150,
                              child: FuelCard(item: listOfItems[index])));
                    });
              } else {
                return const Center(
                  child: Text(
                    'Nothing to be shown',
                    style: TextStyle(
                        color: Color.fromARGB(255, 24, 8, 69), fontSize: 16),
                  ),
                );
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          }),
    );
  }
}

class FuelCard extends StatelessWidget {
  const FuelCard({
    super.key,
    required this.item,
  });
  final item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: Colors.purpleAccent,
      child: ListTile(
        leading: const FuelTileLeading(),
        title: FuelCardTitle(title: item.fillingDate),
        subtitle: FuelCardSubtitle(
          quantity: item.quantity,
          cost: item.cost,
        ),
        trailing: DistanceInfo(
          odometerValue: item.odometerValue,
        ),
      ),
    );
  }
}

class FuelTileLeading extends StatelessWidget {
  const FuelTileLeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.oil_barrel, color: Color.fromARGB(238, 53, 61, 50));
  }
}
