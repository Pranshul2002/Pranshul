

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(showdata());

class showdata extends StatelessWidget {
String dol;
String fill;
String stock;
showdata({this.dol,this.fill,this.stock});
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
                Text(dol)
                ],
              ),
            ),
            ], ),
        ),
      ),
    );
  }
}
