import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping/models/category_list_item.model.dart';
import 'package:shopping/models/product_details.model.dart';
import 'package:shopping/models/product_list_item.model.dart';
import 'package:shopping/repositories/category.repository.dart';
import 'package:shopping/repositories/product.repository.dart';

class ProductBloc extends ChangeNotifier {
  final productRepository = new ProductRepository();

  ProductDetailsModel productDetailsModel;
  String selectedProduct = "none";

  getProductById() {
    this.productDetailsModel = null;
    productRepository.getById(selectedProduct, (data) {
      this.productDetailsModel = data;
      notifyListeners();
    });
  }

  changeId(tag) {
    selectedProduct = tag;
    getProductById();
    notifyListeners();
  }
}
