class Master {
  bool? status;
  List<MasterProducts> products = List<MasterProducts>.empty();

  Master({this.status, required this.products});

  Master.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = new List<MasterProducts>.empty();
      json['products'].forEach((v) {
        products.add(new MasterProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MasterProducts {
  String? isbn;
  String? kdbrg;
  String? judul;
  String? author;
  String? publisher;
  double? harga;
  String? sgroup;
  String? kelas;
  int? umur;

  MasterProducts(
      {required this.isbn,
      required this.kdbrg,
      required this.judul,
      required this.author,
      required this.publisher,
      required this.harga,
      required this.sgroup,
      required this.kelas,
      required this.umur});

  MasterProducts.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'] as String;
    kdbrg = json['kdbrg'] as String;
    judul = json['judul'] as String;
    author = json['author'] as String;
    publisher = json['publisher'] as String;
    harga = json['harga'] as double;
    sgroup = json['sgroup'] as String;
    kelas = json['kelas'] as String;
    umur = json['umur'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbn'] = this.isbn;
    data['kdbrg'] = this.kdbrg;
    data['judul'] = this.judul;
    data['author'] = this.author;
    data['publisher'] = this.publisher;
    data['harga'] = this.harga;
    data['sgroup'] = this.sgroup;
    data['kelas'] = this.kelas;
    data['umur'] = this.umur;
    return data;
  }
}
// class Master {
//   String isbn;
//   String kdbrg;
//   String kategori;
//   String author;
//   String publisher;
//   double harga;
//   String sgroup;
//   String kelas;
//   int umur;

//   Master({required this.isbn,
//          required this.kdbrg,
//          required this.kategori,
//          required this.author,
//          required this.publisher,
//          required this.harga,
//          required this.sgroup,
//          required this.kelas,
//          required this.umur,
//         });

//   factory Master.fromJson(Map<String, dynamic> json){
//     return Master(
//       isbn: json['isbn'] as String, 
//       kdbrg: json['kdbrg'] as String,
//       kategori: json['kategori'] as String,
//       author: json['author'] as String, 
//       publisher: json['publisher'] as String,
//       harga: json['harga'] as double,
//       sgroup: json['sgroup'] as String,
//       kelas: json['kelas'] as String, 
//       umur: json['umur'] as int
//       ); 
//   }
// }