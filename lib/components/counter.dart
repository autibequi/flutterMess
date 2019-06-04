import 'package:flutter/material.dart';

class CounterManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterManagerState();
  }
}

class _CounterManagerState extends State<CounterManager> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Meh Counter'),
        RaisedButton(
          child: Text(this.counter.toString()),
          onPressed: () {
            setState(() {
              this.counter += 1;
            });
          },
        )
      ],
    );
  }
}
