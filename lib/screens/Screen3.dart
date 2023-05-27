import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speedometer"),
      ),
      body: Column(children: <Widget>[
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

Widget _tripButtons(btnText, context) {
  return Container(
    margin: const EdgeInsets.all(20),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 45, 215, 245),
        foregroundColor: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(btnText),
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
