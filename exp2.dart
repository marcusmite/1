import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: CounterApp(),
      debugShowCheckedModeBanner: false,
    ));

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "$_counter",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    if (_counter > 0) _counter--;
                  }),
                  child: Text("-", style: TextStyle(fontSize: 24)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => setState(() => _counter++),
                  child: Text("+", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

