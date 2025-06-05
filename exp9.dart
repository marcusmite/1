import 'package:flutter/material.dart'; 
void main() => runApp(MaterialApp(home: Home())); 
class Home extends StatelessWidget { 
final products = [ 
{'name': 'Shirt', 'price': '29.99'}, 
{'name': 'Shoes', 'price': '49.99'}, 
{'name': 'Hat', 'price': '15.99'}, 
  ]; 
  @override 
  Widget build(BuildContext c) => Scaffold( 
    appBar: AppBar(title: Text('E-Commerce Shop')), 
    body: ListView( 
      children: products.map((p) => ListTile( 
        title: Text(p['name']!), 
        subtitle: Text('\$${p['price']}'), 
        trailing: ElevatedButton( 
          onPressed: () => ScaffoldMessenger.of(c).showSnackBar( 
            SnackBar(content: Text('${p['name']} added')), 
          ), 
          child: Text('Add'), 
        ), 
        onTap: () => Navigator.push(c, MaterialPageRoute( 
          builder: (_) => Scaffold( 
            appBar: AppBar(title: Text(p['name']!)), 
            body: Center(child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [ 
                Text(p['name']!, style: TextStyle(fontSize: 24)), 
                Text('\$${p['price']}', style: TextStyle(fontSize: 20)), 
              ], 
            )), 
          ), 
        )), 
      )).toList(), 
    ), 
  ); 
}
