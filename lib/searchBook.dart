import 'package:flutter/material.dart';
import './services.dart';

import './master.dart';
class SearchBook extends StatefulWidget {
  @override
  _SearchBookState createState() => new _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  Widget appBarTitle = new Text(
    "Search Book",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  String _searchText = "";
  Master searchresult = new Master();

  _SearchListExampleState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    values();
  }

  void values() {
    //Master master = new Master();
    _list = List();
    _list.add("Indian");
    _list.add("United States");
    _list.add("Australian");
    _list.add("Euro");
    _list.add("British");
    _list.add("Yemeni");
    _list.add("Japanese");
    _list.add("Hong Kong");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        appBar: buildAppBar(context),
        body: new Container(
          child:
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            //   FutureBuilder(
            //     future: Services.getMaster(),//Services.getItem('00084'),
            //     builder: (context, snapshot) {
            //     print("snapshot "+ snapshot.data.toString());
            //     if (snapshot.hasData) {
            //     return Align(
            //     alignment: Alignment.topCenter,
            //     child: ListView(
            //       children: <Widget>[
                   
            //       ],
            //     ));
            // } else {
            // return Container(
            //  child: Text("Loading"),
            //  );
            // }
            // },
            // ),
              new Flexible(
                  child:
                   searchresult != null || _controller.text.isNotEmpty
                  //  ?FutureBuilder(
                  //   future: Services.searchProducts(_searchText),
                  //   builder: (context, snapshot){
                  //     if(snapshot.hasData){
                  //       return ListView(
                  //         children: <Widget>[
                  //           ListTile(
                  //             title: new Text(snapshot.data.status.toString()))
                  //         ],
                  //       );
                  //     } else{
                  //       return Container(
                  //         child: Text("Loading"),
                  //       );
                  //     }
                  //   },
                  // )
                     ? new ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchresult.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<Products> listData = List<Products>.empty(growable: true);
                            listData.add(searchresult.products[index]);
                            return new ListTile(
                              title: new Text(listData[0].judul + " " + listData[0].isbn),
                            );
                          },
                        )
                      : new ListView.builder(
                          shrinkWrap: true,
                          itemCount: _list.length,
                          itemBuilder: (BuildContext context, int index) {
                            String listData = _list[index];
                            return new ListTile(
                              title: new Text(listData.toString()),
                            );
                          },
                        ))
            ],
          ),
        ));
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
            if (this.icon.icon == Icons.search) {
              this.icon = new Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = new TextField(
                controller: _controller,
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white)),
                onChanged: searchOperation,
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
  //    searchresult.clear();
    if (_isSearching != null) {
      Services.searchProducts(searchText).then((value){
        setState(() {
          this.searchresult = value;
        });
      });
      //Future<Master> master = Services.searchProducts(searchText);
      // for (int i = 0; i < _list.length; i++) {
      //   String data = _list[i];
      //   if (data.toLowerCase().contains(searchText.toLowerCase())) {
      //     searchresult.add(data);
      //   }
      }
    }
}  
// import 'package:flutter/material.dart';
// import './stock.dart';
// import './master.dart';
// import'./services.dart';

// class StockList extends StatelessWidget {
//   final Stock stocks;


//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) {
//         return Divider(color: Colors.grey);
//       },
//       itemCount: stocks.length,
//       itemBuilder: (context, index) {
//         final stock = stocks[index];

//         return ListTile(
//           contentPadding: EdgeInsets.all(10),
//           title: Column(
//             crossAxisAlignment:  CrossAxisAlignment.start,
//             children: <Widget>[
//             Text(
//               stock.isbn,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//              Text(
//               "ISBN : " + stock.isbn,
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               "Location : " + stock.location,
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               "binloc : " + stock.binloc,
//               style: TextStyle(fontSize: 18),
//             ),
//           ]),
//           trailing: Column(children: <Widget>[
//             Text("Stock : "+stock.bookStock.toString(), style: TextStyle(fontSize: 24),)
//           ],),
//         );
//       },
//     );
//   }
// }
