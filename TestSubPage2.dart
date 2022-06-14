import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemPageDetailView2 extends StatelessWidget {
  final DocumentSnapshot itModel;

  const ItemPageDetailView2({
    Key itkey,
    @required this.itModel,
  }) : super(key: itkey);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            Colors.blue,
            Colors.green,
            Colors.red,
            Colors.yellow,
          ]))),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(itModel.get('*Insert Name of Firestore Document Field With Firebase Storage Photo Downloadurl*')),
                  fit: BoxFit.cover)),
        ));
  }
}
