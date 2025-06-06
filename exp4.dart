import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Todo()));

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _t = <T>[];
  final _c = TextEditingController();

  void _a() {
    if (_c.text.isNotEmpty) {
      setState(() {
        _t.add(T(_c.text));
        _c.clear();
      });
    }
  }

  void _g(i) => setState(() => _t[i].d = !_t[i].d);
  void _d(i) => setState(() => _t.removeAt(i));

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('To-do List')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _c,
                      onSubmitted: (_) => _a(),
                    ),
                  ),
                  ElevatedButton(onPressed: _a, child: const Text('+')),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _t.length,
                itemBuilder: (context, i) => ListTile(
                  leading: Checkbox(
                    value: _t[i].d,
                    onChanged: (_) => _g(i),
                  ),
                  title: Text(
                    _t[i].t,
                    style: TextStyle(
                      decoration:
                          _t[i].d ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _d(i),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class T {
  String t;
  bool d;

  T(this.t, {this.d = false});
}
