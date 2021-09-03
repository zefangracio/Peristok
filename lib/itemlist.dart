import 'package:flutter/material.dart';
import './services.dart';
import './stock.dart';

class ItemList extends StatefulWidget {
  ItemList() : super();
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Stock> stock = List<Stock>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    stock = [];
  }

  Future<bool> getItem(String isbn) {
    var check;
    Services.getItem(isbn).then((stock) {
      setState(() {
        this.stock = stock;
        check = true;
      });
    });
  return check;
  }

  Widget build(BuildContext context) {
    const judul = 'Web Images';
    //getItem("00084");
    //print(stock[0].products[0].binloc);
    //var item = stock;
    return MaterialApp(
        title: judul,
        home: Scaffold(
            body: Container(
                child: FutureBuilder(
                future: getItem("00084"),
                builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.hasData) {
                return Align(
                alignment: Alignment.topCenter,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(40),
                      child:
                          Image.network('https://st.xsm.us/c/b/9781501110368'),
                    ),
                    Card(
                        child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Judul :"),
                            Text("ISBN"),
                            Text("Location"),
                          ]),
                    ))
                  ],
                ));
            } else {
            return Container(
             child: Text("Loading"),
             );
            }
            },
            ) )),
        );
  }
}
// class ItemList extends StatelessWidget {
//   List<Stock> stock = new List<Stock>.empty(growable: true);
//   @override
//   getItem(String isbn){
//     Services.getItem(isbn).then((stock){
//       setState(() {
//         this.stock = stock;
//       });
//     });
//   }
//   Widget build(BuildContext context) {
//     var title = 'Web Images';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//           body: Container(
//         child: Align(
//             alignment: Alignment.topCenter,
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.all(40),
//                   child: Image.network('https://st.xsm.us/c/b/9781501110368'),
//                 ),
//               ],
//             )),
//       )),
//     );
//   }
// }

