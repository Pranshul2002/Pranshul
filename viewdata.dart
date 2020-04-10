

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/data.dart';

import 'getdata.dart';
void main() => runApp(ViewData());

class ViewData extends StatelessWidget {
  String email;

  ViewData({this.email});


  TextEditingController siteid = new TextEditingController();
  TextEditingController date = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                  Container(padding: EdgeInsets.all(20.0),
                  child: TextField(obscureText: false,
                    controller: siteid,decoration: InputDecoration(border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.amber)
                    ),labelText: "SiteId",hoverColor: Colors.amber,),
                  ),
                ),
                Container(padding: EdgeInsets.all(20.0),
                  child: TextField(obscureText: false,
                    controller: date,decoration: InputDecoration(border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.amber)
                    ),labelText: "Date",hoverColor: Colors.amber,hintText: "dd-mm-yyyy"),
                  ),
                ),
                SizedBox(height: 30,),
                RaisedButton(onPressed: (){
                  if(siteid.text.length > 0 && date.text.length > 0 ){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => getData(siteid: siteid.text.toString(),date: date.text.toString(),email: email,)));
                  }

                  },
                  child: Text("Get Data",style: TextStyle(color: Colors.white),),
                color: Colors.green,
                )
              ],
              ),
            ),
         ], ),
        ),
      ),
    );
  }
}

