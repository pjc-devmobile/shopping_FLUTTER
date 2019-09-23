import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/models/authenticate_user.model.dart';
import 'package:shopping/ui/android/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var username = "";
  var password = "";

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: formListView(context),
        ),
      ),
    );
  }

  Widget formListView(BuildContext context) {
    return ListView(
      children: <Widget>[
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
            username = value;
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
            password = value;
          },
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            "Entrar",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              authenticate(context);
            }
          },
        ),
        FlatButton(
          child: Text(
            "Não tem cadastro?",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignupPage())),
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/icons/logo_google.png", height: 36,),
              Text(
                "Login com a Google",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          onPressed: () => loginGoogle(),
        ),
      ],
    );
  }

  authenticate(BuildContext context) async {
    var bloc = Provider.of<UserBloc>(context);

    var user = await bloc.authenticate(AuthenticateModel(
      username: username,
      password: password,
    ));

    if (user == null) {
      final snackbar = SnackBar(
        content: Text("Usuário ou senha inválidos"),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
    } else {
      Navigator.pop(context);
      return;
    }
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  loginGoogle() async{
   await _handleSignIn()
        .then((FirebaseUser user) => print(user))
        .catchError((e) => print(e));
  }
}
