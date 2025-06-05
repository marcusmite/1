import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Seamless Navigation',
  initialRoute: '/',
  routes: {
    '/': (context) => Scaffold(
          appBar: AppBar(title: Text('Home Screen')),
          body: Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/details'),
              child: Text('Go to Details'),
            ),
          ),
        ),
    '/details': (context) => Scaffold(
          appBar: AppBar(title: Text('Details Screen')),
          body: Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back to Home'),
            ),
          ),
        ),
  },
));
