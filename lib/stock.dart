class Stock {
  bool? status;
  List<Products> products = List<Products>.empty(growable: true);

  Stock({
     this.status, 
     required this.products});

  Stock.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = new List<Products>.empty(growable: true);
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    // ignore: unnecessary_null_comparison
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? isbn;
  int? stock;
  String? location;
  String? binloc;

  Products({required this.isbn, required this.stock, required this.location, required this.binloc});

  Products.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'];
    stock = json['stock'];
    location = json['location'];
    binloc = json['binloc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbn'] = this.isbn;
    data['stock'] = this.stock;
    data['location'] = this.location;
    data['binloc'] = this.binloc;
    return data;
  }
}
// class Stock {
//   String isbn;
//   int bookStock;
//   String location;
//   String binloc;

//   Stock({required this.isbn,
//          required this.bookStock,
//          required this.location,
//          required this.binloc});

//   factory Stock.fromJson(Map<String, dynamic> json){
//     return Stock(
//       isbn: json['isbn'] as String,
//       bookStock: json['bookStock'] as int,
//       location: json['location'] as String,
//       binloc: json['binloc'] as String,
//     );
//   }

//   static getAll(){
//     // List<Stock> stock = <Stock>[];
//     // stock.add(Stock(isbn: '12345', bookStock: 10, location: 'ABC', binloc: 'D124'));
//     // stock.add(Stock(isbn: '421412', bookStock: 5, location: 'BDSB', binloc: 'B545'));
//     // stock.add(Stock(isbn: '24142', bookStock: 4, location: 'AFDG', binloc: 'C6436'));
//     // return stock;
//   }
// }