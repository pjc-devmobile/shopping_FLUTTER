import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/product.bloc.dart';
import 'package:shopping/models/product_list_item.model.dart';
import 'package:shopping/ui/android/pages/product_page.dart';
import 'package:shopping/ui/shared/widgets/shared/add_to_cart.widget.dart';

class ProductCard extends StatelessWidget {
  final ProductListItemModel item;

  ProductCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ProductBloc>(context);
    final price = new NumberFormat("#,##0.00", "pt_BR");

    return Container(
      margin: EdgeInsets.all(5),
      width: 240,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.03),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         GestureDetector(
           onTap: (){
             bloc.changeId(item.id);
             Navigator.push(context, MaterialPageRoute(
               builder: (context) => ProductPage(id: item.id,)
             ));
           },
           child:  Container(
             width: 240,
             height: 240,
             decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0.05),
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(5),
                   bottomRight: Radius.circular(5),
                 ),
                 image: DecorationImage(
                   image: NetworkImage(item.image),
                 )),
           ),
         ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 60,
            child: Text(item.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),
          ),
          SizedBox(height: 5),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(item.brand,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 120,
                  child:Text(
                    "R\$ ${price.format(item.price)}",
                    style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor,fontWeight: FontWeight.w300),
                  ),
                ),
                AddToCart(item: item,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
