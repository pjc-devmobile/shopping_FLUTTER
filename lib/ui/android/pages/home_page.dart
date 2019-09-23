import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/ui/shared/widgets/category/category_list.widget.dart';
import 'package:shopping/ui/shared/widgets/product/product_list.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping cart"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              (bloc.selectedCategory == "todos")
                  ? "Categorias"
                  : (bloc.selectedCategory.substring(0, 1).toUpperCase() +
                      bloc.selectedCategory.substring(1)),
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              height: 10,
            ),
            CategoryList(
              categories: bloc.categories,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ProductList(products: bloc.products),
              ),
            )
          ],
        ),
      ),
    );
  }
}
