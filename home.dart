import 'package:flutter/material.dart';
import 'package:testapp/adddata.dart';
import 'package:testapp/viewdata.dart';


void main() => runApp(Home());

class Home extends StatelessWidget{
  String email;
  Home({this.email});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                RaisedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => adddata(email: email,)));
                  },
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Add Data",style: TextStyle(color: Colors.white,fontSize: 30),),
                  ),
                ),
                SizedBox(height: 50,),
                RaisedButton(
                  onPressed: (){
                    print(email);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => ViewData(email: email,)));
                  },
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text("View Data",style: TextStyle(color: Colors.white,fontSize: 30),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


