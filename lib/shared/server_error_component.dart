import 'package:flutter/material.dart';

class ServerErrorComponent extends StatelessWidget {
  const ServerErrorComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons8-error.gif',
            scale: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, right: 5.0, left: 5.0),
            child: Text('Something went wrong, please try again',
                style: TextStyle(
                    color: Color.fromARGB(255, 233, 30, 30), fontSize: 15)),
          )
        ],
      ),
    );
  }
}
