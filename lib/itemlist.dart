import 'package:flutter/material.dart';
import './services.dart';
import 'bookDetail.dart';


class ItemList extends StatefulWidget {
  ItemList() : super();
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
 // List<Stock> stock = List<Stock>.empty(growable: true);
  BookDetail book = BookDetail();
  @override
  void initState() {
    super.initState();
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
                future: Services.getProduct('00084'),
                builder: (context, snapshot) {
                print("snapshot "+ snapshot.data.toString());
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
                            Text("Judul : " + snapshot.data.product.judul),
                            Text("ISBN : " + snapshot.data.product.isbn),
                            Text("Author : " + snapshot.data.product.author),
                            Text("Kode Barang : "+snapshot.data.product.kdbrg),
                            Text("Publisher : " + snapshot.data.product.publisher),
                            Text("Harga : " + snapshot.data.product.harga.toString()),
                            Text("Sgroup : " + snapshot.data.product.sgroup),
                            Text("Kelas : " + snapshot.data.product.kelas),
                            Text("Umur : " + snapshot.data.product.umur.toString()),
                            Text("Location : "),
                            for(var i in snapshot.data.product.item) Text("   "+i.location.toString() + " : "+ i.stock.toString())
                            //Text("Location : "+ snapshot.data.product.item[0].location.toString()),
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

