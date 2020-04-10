import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testapp/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: SafeArea(child: Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Container(padding: EdgeInsets.only(left: 20),
                child: Text("Login",style: TextStyle(color: Colors.blue,fontSize: 100,fontWeight: FontWeight.bold),)
            ),
            SizedBox(height: 100,),
            Login(),
        ],),
      ),
    )),
  );
  }}

class Login extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => login_state();


  }


class login_state extends State<Login>{

  TextEditingController email = new TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController password = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future < FirebaseUser > signIn(String email, String password) async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
      print(email);
      Navigator.push(context,MaterialPageRoute(builder: (context) => Home(email: email,)));
      return user;
    }
    catch (e) {

      print(e);
      return null;
    }
  }
  final _formKey = GlobalKey<FormState>();
@override
Widget build(BuildContext context) {
  // TODO: implement build
  return Form(key: _formKey,
    child: Column(
      children: <Widget>[
        SizedBox(height:40),
        Container(padding: EdgeInsets.all(20.0),
          child: TextFormField(obscureText: false,
            validator: (value){
            if(!value.contains("@"))
            return "Please Enter Valid Email";
            else
              return null;
            },
            controller: email,decoration: InputDecoration(border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.amber)
            ),icon: Icon(Icons.email,color: Colors.blue),labelText: "Email",hoverColor: Colors.amber,),
          ),
        ),
        Container(padding: EdgeInsets.all(20.0),
          child: TextFormField(
            obscureText: true,
            controller: password,decoration: InputDecoration(border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.amber)
            ),icon: Icon(Icons.lock,color: Colors.blue),labelText: "Password",hoverColor: Colors.amber,),
          ),
        ),
        SizedBox(height: 30,),
        Center(
          child: RaisedButton(color: Colors.green,splashColor: Colors.greenAccent,disabledColor: Colors.red,
            child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 15),),onPressed: (){if(_formKey.currentState.validate())
            signIn(email.text.toString().trim(), password.text.toString().trim());
            },),),
        SizedBox(height: 10,),
      ]),
  );
}
}