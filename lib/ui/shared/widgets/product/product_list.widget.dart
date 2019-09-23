import 'package:flutter/cupertino.dart';
import 'package:shopping/models/product_list_item.model.dart';
import 'package:shopping/ui/shared/widgets/product/product_card.widget.dart';
import 'package:shopping/ui/shared/widgets/shared/loader_list.widget.dart';

class ProductList extends StatelessWidget {
  final List<ProductListItemModel> products;

  const ProductList({@required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: LoaderList(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        ProductListItemModel item = products[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: ProductCard(
            item: item,
          ),
        );
      },
    );
  }

}
