import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App by Pranshul Goyal',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}
class Calculator extends StatefulWidget {

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController _data = TextEditingController();

  Parser p = Parser();
String  _evaluate(String exp){
   try{
     Expression e = p.parse(exp);
     ContextModel cm  = ContextModel();
     return e.evaluate(EvaluationType.REAL, cm).toString();
   }catch(e){
     return "error";
   }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
body: ListView(
  children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 50,),
              SizedBox(width: MediaQuery.of(context).size.width - 20,
                child: Container(padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: _data.text,labelStyle: TextStyle(color: Colors.black,
                      fontSize: 30
                    ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(padding: EdgeInsets.only(left: 8.0),
                child: Row(

                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.clear();
                        });

                      },
                      child: Text("CLR",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text.toString().substring(0,_data.text.length -1);
                        });
                      },
                      child: Text("DEL",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(

                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + "0";
                          
                        });
                      },
                      child: Text("0",style: TextStyle(fontSize: 30),),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                           _data.text = _data.text + "1";
                           
                        });

                      },
                      child: Text("1",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + "2";
                        });
                      },
                      child: Text("2",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(

                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + "3";
                          
                        });
                      },
                      child: Text("3",style: TextStyle(fontSize: 30),),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + "4";
                        });

                      },
                      child: Text("4",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + "5";
                        });
                      },
                      child: Text("5",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(

                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + "6";
                        });
                      },
                      child: Text("6",style: TextStyle(fontSize: 30),),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + "7";
                        });

                      },
                      child: Text("7",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + "8";
                        });
                      },
                      child: Text("8",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(

                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + "9";
                        });
                      },
                      child: Text("9",style: TextStyle(fontSize: 30),),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + " -";
                        });

                      },
                      child: Text("-",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + " +";
                        });
                      },
                      child: Text("+",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(

                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + " *";
                        });
                      },
                      child: Text("*",style: TextStyle(fontSize: 30),),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + " %";
                        });

                      },
                      child: Text("%",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + " /";
                        });
                      },
                      child: Text("/",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(

                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + " .";
                        });
                      },
                      child: Text(".",style: TextStyle(fontSize: 30),),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + "(";
                        });

                      },
                      child: Text("(",style: TextStyle(fontSize: 30),),
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(
                        onPressed: (){
                          setState(() {
                            _data.text = _evaluate(_data.text.toString().trim());
                          });

                        },
                        child: Text("=",style: TextStyle(fontSize: 30),)
                    ),
                    SizedBox(width: 30,),
                    RaisedButton(

                      onPressed: (){
                        setState(() {
                          _data.text = _data.text + ")";
                        });
                      },
                      child: Text(")",style: TextStyle(fontSize: 30),),
                    ),

                  ],
                ),
              ),

            ],
          )
        ],
      ),
  ],
),
      ),
    );
  }
}
