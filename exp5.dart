import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CalculatorScreen(),
      );
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String result = '0';

  void onButtonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        input = '';
        result = '0';
      } else if (value == '=') {
        result = calculate(input);
      } else {
        input += value;
      }
    });
  }

  String calculate(String expr) {
    try {
      if (expr.contains('+')) {
        var parts = expr.split('+');
        double a = double.parse(parts[0]);
        double b = double.parse(parts[1]);
        return (a + b).toString();
      } else if (expr.contains('-')) {
        var parts = expr.split('-');
        double a = double.parse(parts[0]);
        double b = double.parse(parts[1]);
        return (a - b).toString();
      } else if (expr.contains('*')) {
        var parts = expr.split('*');
        double a = double.parse(parts[0]);
        double b = double.parse(parts[1]);
        return (a * b).toString();
      } else if (expr.contains('/')) {
        var parts = expr.split('/');
        double a = double.parse(parts[0]);
        double b = double.parse(parts[1]);
        if (b == 0) return 'Error';
        return (a / b).toString();
      } else {
        return expr;
      }
    } catch (e) {
      return 'Error';
    }
  }

  Color getButtonColor(String label) {
    if (label == 'AC') return Colors.red;
    if (label == '=') return Colors.green;
    if (['/', '*', '-', '+'].contains(label)) return Colors.orange;
    return Colors.blue;
  }

  Widget buildButton(String label) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ElevatedButton(
            onPressed: () => onButtonPressed(label),
            style: ElevatedButton.styleFrom(
              backgroundColor: getButtonColor(label),
            ),
            child: Text(label, style: TextStyle(fontSize: 24)),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Simple Calculator')),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(input,
                        style: TextStyle(fontSize: 32, color: Colors.grey)),
                    SizedBox(height: 10),
                    Text(result,
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Row(children: ['7', '8', '9', '/'].map(buildButton).toList()),
            Row(children: ['4', '5', '6', '*'].map(buildButton).toList()),
            Row(children: ['1', '2', '3', '-'].map(buildButton).toList()),
            Row(children: ['AC', '0', '=', '+'].map(buildButton).toList()),
          ],
        ),
      );
}
