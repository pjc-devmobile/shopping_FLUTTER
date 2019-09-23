import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/models/product_details.model.dart';
import 'package:shopping/models/product_list_item.model.dart';

class ProductRepository {
  final _db = Firestore.instance;

  void getAll(callback) async {
    _db.collection("products")
        .snapshots().listen((data) => callback(data
        .documents
        .map((doc) => ProductListItemModel.fromJson(doc.data))
        .toList()));
  }

  void getByCategory(category, callback) async {
    _db.collection("products")
        .where("categories.$category", isEqualTo: true)
        .snapshots().listen(
        (data) => callback(data.documents
            .map((doc) => ProductListItemModel.fromJson(doc.data))
            .toList()));
  }

  void getById(id, callback) async {
    _db
        .collection("products")
        .document(id)
        .snapshots()
        .listen((data) => callback((ProductDetailsModel.fromJson(data.data))));
  }
}
