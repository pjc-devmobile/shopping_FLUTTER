import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/models/category_list_item.model.dart';

class CategoryRepository {

  final _db = Firestore.instance;

  void getAll(callback) async{
    _db
        .collection("categories")
        .snapshots()
        .listen((data) => callback(data.documents
            .map((doc) => CategoryListItemModel.fromJson(doc.data))
            .toList()));
  }
}
