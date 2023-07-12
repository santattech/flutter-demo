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
import 'package:learningdart/shared/loading_component.dart';
import 'package:learningdart/widget/nav_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:learningdart/shared/app_secret.dart';

class FuelEntryScreen extends ConsumerStatefulWidget {
  const FuelEntryScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<FuelEntryScreen> createState() => _FuelEntryScreen();
}

//********** This code snippet can be useful when you replace the API with hard coded JSON ************* */
// Future<String> _loadFuelLogs() async {
//   return await rootBundle.loadString('assets/fuelLog.json');
// }

// Future<FuelModel> getFuelLogs() async {
//   String jsonFuelData = await _loadFuelLogs();

//   print(parseResponseBody(jsonFuelData));
//   return FuelModel.fromJson(parseResponseBody(jsonFuelData));
// }
//********** End of the hard coded JSON code snippet ************* */

Future<FuelModel> getFuelLogs() async {
  // call the getFuelLogs API
  const String apiUrl = AppSecret.getFuelLogsUrl;
  Map<String, String> headerData = {
    "Content-Type": 'application/json',
    'Authorization': AppSecret.accessToken,
  };

  try {
    http.Response response =
        await http.get(Uri.parse(apiUrl), headers: headerData);

    return FuelModel.fromJson(parseResponseBody(response));
  } catch (e) {
    rethrow;
  }
}

Map<String, dynamic> parseResponseBody(http.Response response) {
  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else if (response.statusCode == 404) {
    throw Exception('Wrong creds');
  } else if (response.statusCode == 401) {
    throw Exception('Unauthorized');
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
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Mileage log'),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<FuelModel>(
          future: getFuelLogs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingComponent();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 24, 8, 69),
                            fontSize: 16),
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasData) {
                final fuelData = snapshot.data;
                var listOfItems = fuelData?.data as List;
                int itemCount = listOfItems.length;

                return ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      var singleData = listOfItems[index];
                      var singleDataAttributes = singleData.attributes;

                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Container(
                              height: 150,
                              child: FuelCard(item: singleDataAttributes)));
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
        title: FuelCardTitle(title: item.entryDate),
        subtitle: FuelCardSubtitle(
          quantity: item.quantity,
          cost: item.price,
          totalPrice: item.totalPrice,
        ),
        trailing: DistanceInfo(
          odometerValue: item.odometer,
          betweenDistance: 100,
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
