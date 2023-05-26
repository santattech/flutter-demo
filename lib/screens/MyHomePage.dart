import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _buttonPressedText = 'Please press a button';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(20),
                child: TextButton(
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(10),
                    child: const Text('Go to Screen 2',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _buttonPressedText = 'You have pressed Elevated Button';
                    });
                  },
                  child: const Text('Elevated button'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                      width: 1,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _buttonPressedText = 'You have pressed Outlined Button';
                    });
                  },
                  child: const Text('Outlined button'),
                ),
              ),
              Text(_buttonPressedText,
                  style: const TextStyle(color: Colors.red, fontSize: 15)),
              const Text('You have pushed the button this many times:',
                  style: TextStyle(
                    color: Colors.green,
                  )),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(
                child: Container(
                  color: const Color.fromARGB(255, 231, 149, 16),
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: const Text(
                    'Flat Button',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _buttonPressedText =
                        'You have pressed the below Flat button';
                  });
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
