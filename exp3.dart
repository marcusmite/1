import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: _L(), debugShowCheckedModeBanner: false));

class _L extends StatelessWidget {
  void s(BuildContext c, String m) => ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text(m)));

  @override
  Widget build(BuildContext c) => Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(decoration: InputDecoration(labelText: "Username")),
              TextField(decoration: InputDecoration(labelText: "Password"), obscureText: true),
              TextButton(
                  onPressed: () => s(c, "Password reset link sent!"),
                  child: Text("Forgot Password?")),
              ElevatedButton(onPressed: () => s(c, "Login Clicked!"), child: Text("Login")),
            ],
          ),
        ),
      );
}
