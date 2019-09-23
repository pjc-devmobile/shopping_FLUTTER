import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/home.bloc.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);

    return CupertinoPageScaffold(

    );
  }
}
