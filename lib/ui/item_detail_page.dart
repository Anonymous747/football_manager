import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Developer: kobrinets_m@mail.ru"),
      )
    );
  }
}