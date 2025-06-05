import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LogoAnim()));

class LogoAnim extends StatefulWidget {
  @override
  _LogoAnimState createState() => _LogoAnimState();
}

class _LogoAnimState extends State<LogoAnim> with SingleTickerProviderStateMixin {
  late AnimationController c;
  late Animation<Offset> a;

  @override
  void initState() {
    super.initState();
    c = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    )..repeat(reverse: true);

    a = Tween(
      begin: Offset.zero,
      end: Offset(0, 2.5),
    ).animate(CurvedAnimation(
      parent: c,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext cxt) => Scaffold(
        appBar: AppBar(title: Text('Animated Logo')),
        body: Center(
          child: SlideTransition(
            position: a,
            child: FlutterLogo(size: 100),
          ),
        ),
      );
}
