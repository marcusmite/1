import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(home: WeatherApp(), debugShowCheckedModeBanner: false));

class WeatherApp extends StatefulWidget {
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final c = TextEditingController();
  String info = '';

  void getWeather() async {
    if (c.text.trim().isEmpty) return;
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=${c.text}&appid=0830225e3b25a0708dd3a3720b39f071';
    try {
      var res = await http.get(Uri.parse(url));
      var d = jsonDecode(res.body);
      setState(() {
        info = res.statusCode == 200
            ? 'Temp: ${(d['main']['temp'] - 273.15).toStringAsFixed(1)}°C\n${d['weather'][0]['description']}'
            : 'City not found';
      });
    } catch (_) {
      setState(() => info = 'Error fetching weather');
    }
  }

  @override
  Widget build(BuildContext ctx) => Scaffold(
        appBar: AppBar(title: Text('Weather')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: c,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter city',
                ),
              ),
              ElevatedButton(onPressed: getWeather, child: Text('Check')),
              SizedBox(height: 20),
              Text(info, textAlign: TextAlign.center),
            ],
          ),
        ),
      );
}
