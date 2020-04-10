import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

void main() => runApp(adddata());

class adddata extends StatefulWidget{
  String email;
  adddata({this.email});
  @override
  adddata_state createState() {
    // TODO: implement createState
    return adddata_state();
  }
}
class adddata_state extends State<adddata>{

  TextEditingController dol = new TextEditingController();
  TextEditingController fill = new TextEditingController();
  TextEditingController stock = new TextEditingController();
  TextEditingController siteid = new TextEditingController();
  TextEditingController date = new TextEditingController();
  final databaseReference = Firestore.instance;
  void createRecord(String siteid,String date) async {

      await databaseReference.collection(widget.email)
          .document("$siteid-$date")
          .setData({
        'dol': dol.text,
        'fill': fill.text,
        'stock': stock.text,
      });

  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(padding: EdgeInsets.only(top: 30,bottom: 30,left: 10,right: 10),
                  child: TextFormField(

                    validator: (value){
                    if(value.contains("-") && !value.contains(" ") && value.length == 10){
                      return null;
                    }
                    else
                      return "wrong format";
                  },
                    controller: siteid,decoration: InputDecoration(border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.amber)
                  ),labelText: "SiteId",labelStyle: TextStyle(fontSize: 20),hintText: "IN-xxxxxxx",
                  ),
                  ),
                ),

                Container(padding: EdgeInsets.only(top: 30,bottom: 30,left: 10,right: 10),
                  child: TextFormField(
                    validator: (value){
                      if(value.contains("-") && !value.contains(" ") && value.length == 10){
                        return null;
                      }
                      else {

                        return "wrong format";
                      }
                        },
                    controller: date,decoration: InputDecoration(border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.amber)
                  ),labelText: "Date",labelStyle: TextStyle(fontSize: 20),hintText: "dd-mm-yyyy",
                  ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 30,bottom: 30,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: dol,decoration: InputDecoration(border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.amber)
                  ),labelText: "Diesel Consumed Today",labelStyle: TextStyle(fontSize: 20),hintText: "In Hours",
                  ),
                  ),
                ),
                Container(padding: EdgeInsets.only(top: 30,bottom: 30,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: fill,decoration: InputDecoration(border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.amber)
                  ),labelText: "Diesel Filled Today",labelStyle: TextStyle(fontSize: 20),hintText: "In Litres",
                  ),
                  ),
                ),
                Container(padding: EdgeInsets.only(top: 30,bottom: 30,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: stock,decoration: InputDecoration(border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.amber)
                  ),labelText: "Diesel in Stock",labelStyle: TextStyle(fontSize: 20),hintText: "In Litres"
                  ),
                  ),
                ),
              Container(
                padding: EdgeInsets.all(5),
                child: RaisedButton(color: Colors.green,
                  child: Text("Update",style: TextStyle(color: Colors.white,fontSize: 20),),
                  onPressed:() {

                   if( _formKey.currentState.validate() ) {
                    createRecord(siteid.text,date.text);
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Updated!'))
                    );

                  }
                   else
                     Scaffold.of(context)
                         .showSnackBar(SnackBar(content: Text('please enter valid data'))

                     );

                   }
                )
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}