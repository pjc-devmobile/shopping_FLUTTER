import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/ui/android/pages/settings_page.dart';
import 'package:shopping/ui/shared/widgets/account/authenticated_user_card.widget.dart';
import 'package:shopping/ui/shared/widgets/account/unauthenticated_user_card.widget.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Minha conta"),
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage())),
          )
        ],
      ),
      body: bloc.user == null
          ? UnauthenticatedUserCard()
          : AuthenticatedUserCard(),
    );
  }
}
