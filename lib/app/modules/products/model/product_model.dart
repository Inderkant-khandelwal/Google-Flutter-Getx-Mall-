// This code owner is Inderkant a Software Developer
// and anyone can download and use this code
// Happy Coding
// Github: https://github.com/Inderkant-khandelwal
// Linkedin: https://linkedin.com/in/inderkant

class Product {
  int? status;
  String? message;
  int? totalRecord;
  int? totalPage;
  List<Data>? data;

  Product(
      {this.status, this.message, this.totalRecord, this.totalPage, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalRecord = json['totalRecord'];
    totalPage = json['totalPage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final dataX = <String, dynamic>{};
    dataX['status'] = status;
    dataX['message'] = message;
    dataX['totalRecord'] = totalRecord;
    dataX['totalPage'] = totalPage;
    dataX['data'] = data?.map((v) => v.toJson()).toList();
    return dataX;
  }

  @override
  toString() => 'Data: $data';
}

class Data {
  int? id;
  String? slug;
  String? title;
  String? description;
  int? price;
  String? featuredImage;
  String? status;
  String? createdAt;

  Data(
      {this.id,
      this.slug,
      this.title,
      this.description,
      this.price,
      this.featuredImage,
      this.status,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    featuredImage = json['featured_image'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['featured_image'] = featuredImage;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
