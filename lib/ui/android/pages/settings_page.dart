import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/blocs/theme.bloc.dart';
import 'package:shopping/settings.dart';
import 'package:shopping/themes/dark.theme.dart';
import 'package:shopping/themes/dark_yellow.theme.dart';
import 'package:shopping/themes/light.theme.dart';

class SettingsPage extends StatelessWidget {
  ThemeBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Text(
              "Tema atual: ${Settings.theme}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: lightTheme().primaryColor,
              child: Text(
                "Light",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => save("light"),
            ),
            RaisedButton(
              color: Colors.black,
              child: Text(
                "Dark",
                style: TextStyle(color: darkTheme().accentColor),
              ),
              onPressed: () => save("dark"),
            ),
            RaisedButton(
              color: darkYellowTheme().primaryColor,
              child: Text(
                "Dark yellow",
                style: TextStyle(color: Colors.black,),
              ),
              onPressed: () => save("dark_yellow"),
            )
          ],
        ),
      ),
    );
  }

  save(var theme) async {
    bloc.change(theme);
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", theme);
  }
}
