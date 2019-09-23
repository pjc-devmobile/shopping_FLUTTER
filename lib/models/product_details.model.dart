import 'package:shopping/models/category.model.dart';

class ProductDetailsModel {
  String id;
  String title;
  String brand;
  String tag;
  double price;
  String description;
  CategoryModel category;
  List<String> images;

  ProductDetailsModel(
      {this.id,
      this.title,
      this.brand,
      this.tag,
      this.price,
      this.description,
      this.category,
      this.images});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    brand = json['brand'];
    tag = json['tag'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    category = json['category'] != null
      ? new CategoryModel.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['brand'] = this.brand;
    data['tag'] = this.tag;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category.toJson();
    if (this.images != null) {
      data['images'] = images;
    }
    return data;
  }
}
