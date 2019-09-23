import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/product.bloc.dart';
import 'package:shopping/models/product_details.model.dart';
import 'package:shopping/models/product_list_item.model.dart';
import 'package:shopping/repositories/product.repository.dart';
import 'package:shopping/ui/shared/widgets/shared/add_to_cart.widget.dart';
import 'package:shopping/ui/shared/widgets/shared/loader_item.widget.dart';
import 'package:shopping/ui/shared/widgets/shared/loader_list.widget.dart';

class ProductPage extends StatelessWidget {
  final String id;

  ProductPage({@required this.id});

/*
  //Future Builder
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      future: _repository.getById(id, null),
      builder: (context, snapshot) {
        ProductDetailsModel product = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("Aguardando...");

          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: GenericProgressIndicator(),
            );

          case ConnectionState.done:
            if (snapshot.hasError)
              return Center(
                child: Text(
                    "Não foi possível obter o produto\nError:${snapshot.error}"),
              );
            return content(product);
        }

        return null;
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ProductBloc>(context);

    return Scaffold(
      body: LoaderItem(
        object: bloc.productDetailsModel,
        callback: content,
      ),
    );
  }

  Widget content(ProductDetailsModel product) {
    ProductListItemModel productListModel = new ProductListItemModel(
        id: product.id,
        title: product.title,
        brand: product.brand,
        tag: product.tag,
        price: product.price,
        image: product.images[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.images.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    width: 200,
                    child: Image.network(product.images[index]),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: AddToCart(
                item: productListModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
