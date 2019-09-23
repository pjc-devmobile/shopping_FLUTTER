import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/models/cart_item.model.dart';
import 'package:shopping/models/product_list_item.model.dart';

class AddToCart extends StatelessWidget {
  final ProductListItemModel item;

  const AddToCart({@required this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);

    var cartItem = new CartItemModel(
        id: item.id,
        price: item.price,
        image: item.image,
        quantity: 1,
        title: item.title);

    if (!bloc.itemInCart(cartItem)) {
      return Container(
        width: 80,
        height: 40,
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          child: Icon(Icons.add_shopping_cart),
          textColor: Colors.white,
          onPressed: () {
            bloc.add(cartItem);
            final snackbar = SnackBar(
              content: Text("${item.title} adicionado"),
            );
            Scaffold.of(context).showSnackBar(snackbar);
          },
        ),
      );
    } else {
      return Container(
        width: 80,
        height: 40,
        child: FlatButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Icon(Icons.remove_shopping_cart),
          onPressed: () {
            bloc.remove(cartItem);
            final snackbar = SnackBar(
              content: Text("${item.title} removido"),
            );
            Scaffold.of(context).showSnackBar(snackbar);
          },
        ),
      );
    }
  }
}
