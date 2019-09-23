import 'package:flutter/material.dart';
import 'package:shopping/ui/android/pages/login_page.dart';
import 'package:shopping/ui/android/pages/signup_page.dart';

class UnauthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Theme.of(context).primaryColor,
              child: Text(
                "Entrar",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()))),
          FlatButton(
              child: Text(
                "Ainda não sou cadastrado",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupPage())))
        ],
      ),
    );
  }
}
