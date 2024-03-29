import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/ui/android/pages/cart_page.dart';
import 'package:shopping/ui/android/pages/home_page.dart';

import 'account_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);

    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          HomePage(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: new TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.shopping_cart),
                Container(
                  alignment: Alignment.center,
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(
                    bloc.cart.length.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Tab(
            icon: Icon(Icons.perm_identity),
          )
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
