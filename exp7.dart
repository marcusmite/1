import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: StopwatchApp()));

class StopwatchApp extends StatefulWidget {
  @override
  State createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  Stopwatch sw = Stopwatch();
  Timer? t;
  String time = '00:00:00';

  @override
  void initState() {
    super.initState();
    t = Timer.periodic(Duration(milliseconds: 100), (_) {
      if (sw.isRunning) {
        final ms = sw.elapsedMilliseconds;
        final h = ms ~/ 3600000;
        final m = (ms ~/ 60000) % 60;
        final s = (ms ~/ 1000) % 60;

        setState(() => time =
            "$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}");
      }
    });
  }

  @override
  void dispose() {
    t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext c) => Scaffold(
        appBar: AppBar(title: Text('Stopwatch')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(time, style: TextStyle(fontSize: 48)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: sw.isRunning
                        ? null
                        : () => setState(() => sw.start()),
                    child: Text('Start'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: sw.isRunning
                        ? () => setState(() => sw.stop())
                        : null,
                    child: Text('Stop'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      sw.reset();
                      time = '00:00:00';
                    }),
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
