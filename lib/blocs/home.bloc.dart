import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping/models/category_list_item.model.dart';
import 'package:shopping/models/product_list_item.model.dart';
import 'package:shopping/repositories/category.repository.dart';
import 'package:shopping/repositories/product.repository.dart';

class HomeBloc extends ChangeNotifier {
  final categoryRepository = new CategoryRepository();
  final productRepository = new ProductRepository();

  List<ProductListItemModel> products;
  List<CategoryListItemModel> categories;
  String selectedCategory = "todos";
  String selectedProduct = "none";

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() async {
    categoryRepository.getAll((data) {
      this.categories = data;
      notifyListeners();
    });
  }

  getProducts() async {
    this.products = null;
    productRepository.getAll((data) {
      this.products = data;
      notifyListeners();
    });
  }

  getProductsByCategory() {
    productRepository.getByCategory(selectedCategory, (data) {
      this.products = data;
      notifyListeners();
    });
  }

  changeCategory(tag) {
    this.products = null;
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
    notifyListeners();
  }
}
