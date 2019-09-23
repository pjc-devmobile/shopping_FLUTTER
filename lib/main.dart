import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/blocs/product.bloc.dart';
import 'package:shopping/ui/android/pages/tabs_page.dart';

import 'blocs/theme.bloc.dart';
import 'blocs/user.bloc.dart';

void main() => runApp(MyApp());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return MaterialApp(
      title: 'Shopping cart',
      debugShowCheckedModeBanner: false,
      theme: bloc.theme,
     /*home: TabsPage(),*/
      home: DefaultTabController(
        length: 3,
        child: TabsPage(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(value: HomeBloc()),
        ChangeNotifierProvider<CartBloc>.value(value: CartBloc()),
        ChangeNotifierProvider<UserBloc>.value(value: UserBloc()),
        ChangeNotifierProvider<ThemeBloc>.value(value: ThemeBloc()),
        ChangeNotifierProvider<ProductBloc>.value(value: ProductBloc()),
      ],
      child: Main(),
    );
  }
}
