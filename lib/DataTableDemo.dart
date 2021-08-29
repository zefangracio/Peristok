import 'package:flutter/material.dart';
import 'package:peristock/master.dart';
import './services.dart';
import './stock.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();
  final String title = 'Peristock';
  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  List<Stock> stock = new List<Stock>.empty(growable: true);
  List<Master> master = new List<Master>.empty(growable: true);
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  TextEditingController isbnController = new TextEditingController();
  //Stock selectedStock = Stock(isbn: '', bookStock: 1, location: '', binloc: '');
  String titleProgress = 'GET Stock';
  @override
  void initState() {
    super.initState();
    stock = [];
    titleProgress = widget.title;
    scaffoldKey = GlobalKey();
    isbnController = TextEditingController();
  }

  getMaster(){
    Services.getMaster().then((master){
      setState(() {
        this.master = master;
      });
      print("Length ${this.master.length}");
    });
  }
  getStock() {
    Services.getItem('00084').then((stock){
      setState(() {
        this.stock = stock;
      });
      print("Length ${this.stock.length}");
    });
  }
  //UI
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titleProgress),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              getMaster();
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: isbnController,
                decoration: InputDecoration.collapsed(hintText: 'ISBN'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
