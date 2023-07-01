import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningdart/features/screens/fuel_entries/distance_info.dart';
import 'package:learningdart/features/screens/fuel_entries/fuel_card_subtitle.dart';
import 'package:learningdart/features/screens/fuel_entries/fuel_card_title.dart';
import 'package:learningdart/model/fuel_model.dart';

class FuelEntryScreen extends ConsumerStatefulWidget {
  const FuelEntryScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<FuelEntryScreen> createState() => _FuelEntryScreen();
}

Future<String> _loadFuelLogs() async {
  return await rootBundle.loadString('fuelLog.json');
}

Future<FuelModel> getFuelLogs() async {
  String jsonFuelData = await _loadFuelLogs();
  return FuelModel.fromJson(parseResponseBody(jsonFuelData));
}

Map<String, dynamic> parseResponseBody(response) {
  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
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
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(height: 150, child: FuelCard()));
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

class FuelCard extends StatelessWidget {
  const FuelCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: Colors.purpleAccent,
      child: const ListTile(
        leading: FuelTileLeading(),
        title: FuelCardTitle(),
        subtitle: FuelCardSubtitle(),
        trailing: DistanceInfo(),
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
