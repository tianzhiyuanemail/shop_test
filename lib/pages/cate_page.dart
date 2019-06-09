import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provide/provide.dart';
import 'package:shop_test/provide/conters.dart';

class CatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Number(),
            Mybutton()
          ],
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Provide<Conter>(
        builder: (context,child,counter){
          return Text('${counter.v}');
        },

      ),
    );
  }
}

class Mybutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          Provide.value<Conter>(context).increment();
        },
        child: Text("dssdafssf"),
      ),
    );
  }
}

