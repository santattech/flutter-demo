import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speedometer"),
      ),
      body: Column(children: <Widget>[
        Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.yellow),
              color: Color.fromARGB(255, 35, 26, 26),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: AutoSizeText('60',
                        maxLines: 1,
                        minFontSize: 100,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.cyan,
                            fontFamily: 'Orbitron'))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 25, right: 10),
                        child: Text('km/h',
                            style: TextStyle(color: Colors.cyan, fontSize: 15)))
                  ],
                )
              ],
            )),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.yellow),
            color: Color.fromARGB(255, 35, 26, 26),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledCard(title: "Avg Speed"),
              FilledCard(title: "Max Speed"),
              FilledCard(title: "Avg Speed")
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.yellow),
              color: Colors.black,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _tripButtons('Start Trip', context),
                  _tripButtons('End Trip', context),
                ])),
        travelTimeContainer()
      ]),
    );
  }
}

class FilledCard extends StatelessWidget {
  const FilledCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 20,
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black,
        margin: EdgeInsets.all(8.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: const SizedBox(
          width: 100,
          height: 100,
          child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                'Avg. Speed',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
              )),
        ),
      ),
    );
  }
}

Widget _tripButtons(btnText, context) {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(10),
    height: 60,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 45, 215, 245),
        foregroundColor: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(btnText, style: TextStyle(fontSize: 20)),
    ),
  );
}

travelTimeContainer() {
  return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.yellow),
        color: Colors.black,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.black,
          ),
          child: const Text(
            '01:30:25',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ]));
}
