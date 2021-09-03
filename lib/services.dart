import 'dart:convert';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:peristock/master.dart';
import './stock.dart';

class Services {
  static final String apiUrl = '10.0.2.2';
  static const GET_ITEM_ACTION = 'GET_ITEM';
  static const GET_ALL_MASTER = 'GET_ALL_MASTER';

//   Future<Map<String, dynamic>> postRequest(String url, Map jsonMap) async{
//      print('$url , $jsonMap');
//      HttpClient httpClient = new HttpClient();
//      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
//      request.headers.set('content-type', 'application/json');
//      request.add(utf8.encode(json.encode(jsonMap)));
//      HttpClientResponse response = await request.close();
//      String reply = await response.transform(utf8.decoder).join();
//      print(reply);
//      httpClient.close();
//      Map<String, dynamic>map = json.decode(reply);
//      return map;
// }

  static Future<List<Stock>> getItem(String isbn) async {
    try {
      // print("Masuk");
      var map = Map<String, dynamic>();
      map['action'] = GET_ITEM_ACTION;
      map ['isbn'] = isbn;
      // //var url = 'http://10.0.2.2/peristock/konekApi.php';
      // var uri = Uri.http(apiUrl,'peristock/konekApi.php');
      //final response = await http.post(uri, body: map);
      //print("getStock >> Response:: ${response.body}");

      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient
          .postUrl(Uri.parse('http://10.0.2.2/peristock/konekApi.php'), );
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(map)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      //print(reply);
      httpClient.close();
      Map<String, dynamic> map2 = json.decode(reply);

      //print(map2);
      if (200 == response.statusCode) {
        List<Stock> list = new List<Stock>.empty(growable: true);
        List<Products> produk = new List<Products>.empty(growable: true);
        Stock stock = new Stock(products: produk);

        map2.forEach((key, value) => {
              if (key == 'status')
                {stock.status = value}
              else if (key == 'products')
                {
                  value.forEach((v) => {
                        produk.add(new Products(
                            isbn: v['isbn'],
                            stock: int.parse(v['stock']),
                            location: v['location'],
                            binloc: v['binloc']))
                      }),
                  stock.products = produk
                }
            });
          //  print(stock.status);
          //  print(stock.products[1].location);
        list.add(stock);    
        //print(list.toString());
        //var stock = new Stock.fromJson(map2);
        //print(stock);
        return list;
      } else {
        return List<Stock>.empty();
      }
    } catch (e) { 
      print(e.toString());
    }
    return List<Stock>.empty();
  }

  static Future<List<Master>> getMaster() async {
    try {
      //print("Masuk");
      var map = Map<String, dynamic>();
      map['action'] = GET_ALL_MASTER;

      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient
          .postUrl(Uri.parse('http://10.0.2.2/peristock/konekApi.php'), );
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(map)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
     // print(reply);
      httpClient.close();
      Map<String, dynamic> map2 = json.decode(reply);

      //print(map2);
      if (200 == response.statusCode) {
        List<Master> list = new List<Master>.empty(growable: true);
        List<MasterProducts> produk = new List<MasterProducts>.empty(growable: true);
        Master master = new Master(products: produk);

        map2.forEach((key, value) => {
              if (key == 'status')
                {master.status = value}
              else if (key == 'products')
                {
                  value.forEach((v) => {
                        produk.add(new MasterProducts(
                            isbn: v['isbn'],
                            kdbrg: v['kdbrg'],
                            judul: v['judul'],
                            author: v['author'],
                            publisher: v['publisher'],
                            harga: double.parse(v['harga']),
                            sgroup: v['sgroup'],
                            kelas: v['kelas'],
                            umur: int.parse(v['umur'])))
                      }),
                  master.products = produk
                }
            });
        //    print(master.products[0].harga);
        list.add(master);
        // print(list[0].status);
        // for(var i = 0; i<list.length; i++){
        //   for(var j = 0; j<list[i].products.length; j++){
        //     print(list[i].products[j].isbn);
        //     print(list[i].products[j].kdbrg);
        //     print(list[i].products[j].judul);
        //     print(list[i].products[j].author);
        //     print(list[i].products[j].publisher);
        //     print(list[i].products[j].harga);
        //     print(list[i].products[j].sgroup);
        //     print(list[i].products[j].kelas);
        //     print(list[i].products[j].umur);
        //   }
        // } 
        return list;
      } else {
        return List<Master>.empty();
      }
    } catch (e) {
      print(e.toString());
    }
    return List<Master>.empty();
  }

}
