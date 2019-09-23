import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/models/create_user.model.dart';
import 'package:shopping/ui/shared/validator/custom.validator.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var user = new CreateUserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Cadastro")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: listViewForm(context),
        ),
      ),
    );
  }

  Widget listViewForm(BuildContext context) {
    return ListView(
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: "Nome"),
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          validator: (value) {
            if (value.isEmpty)
              return "Nome inválido";
            else
              return null;
          },
          onSaved: (value) {
            user.name = value;
          },
        ),
        SizedBox(height: 10,),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: "Email"),
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          validator: (value) => CustomValidators.isEmail(value),
          onSaved: (value) {
            user.email = value;
          },
        ),
        SizedBox(height: 10,),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: "Usuário"),
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          validator: (value) {
            if (value.isEmpty)
              return "Usuároio inválido";
            else
              return null;
          },
          onSaved: (value) {
            user.username = value;
          },
        ),
        TextFormField(
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: "Senha"),
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          validator: (value) {
            if (value.isEmpty)
              return "Senha inválida";
            else
              return null;
          },
          onSaved: (value) {
            user.password = value;
          },
        ),
        SizedBox(height: 20,),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            "Cadastrar",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              create(context);
            }
          },
        ),
        FlatButton(
          child: Text(
            "Cancelar",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onPressed: () =>  Navigator.pop(context),
        )
      ],
    );
  }

  create(BuildContext context) async{
    var bloc = Provider.of<UserBloc>(context);
    var res = await bloc.create(user);

    if (res == null) {
      final snackbar = SnackBar(
        content: Text("Não foi possível cadastrar o usuário"),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
    } else {
      Navigator.pop(context);
      return;
    }
  }

}
