import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/viewdata.dart';

void main() => runApp(getData());

class getData extends StatefulWidget{
  String siteid;
  String date;
  String email;
  getData({this.siteid,this.date,this.email});
  @override
  getData_state createState() {
    // TODO: implement createState
    return getData_state(siteid: siteid,date: date);
  }
}

class getData_state extends State<getData>{
  String siteid;
  String date;
  getData_state({this.siteid,this.date});
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: GestureDetector(
        onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context) => ViewData(email: widget.email,)));},
      child: Text("SiteId: $siteid   Date: $date",style: TextStyle(fontSize: 17),))),
      body: StreamBuilder(
        stream: Firestore.instance.collection(widget.email).document("$siteid-$date").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading..");
          }
          return ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30,bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Text("Diesel Used:",style: TextStyle(fontSize: 20),),
                            Text(snapshot.data["dol"].toString(),style: TextStyle(fontSize: 20),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                  padding: EdgeInsets.only(top: 30,bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Text("Diesel Filled:",style: TextStyle(fontSize: 20),),
                            Text(snapshot.data["fill"].toString(),style: TextStyle(fontSize: 20),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30,bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Text("Diesel Available:",style: TextStyle(fontSize: 20),),
                            Text(snapshot.data["stock"].toString(),style: TextStyle(fontSize: 20),),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
          );
        },
      ),
    );
  }
}