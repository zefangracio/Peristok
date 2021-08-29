import 'package:flutter/material.dart';
import 'package:peristock/DataTableDemo.dart';
import 'package:peristock/itemlist.dart';
import './home.dart';
//import './services.dart';
import './stock.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peristock',
      home: new ItemList()
    );
  }
}
