import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemPageDetailView extends StatelessWidget {
  final DocumentSnapshot mdkModel;

  const ItemPageDetailView({
    Key mkey,
    @required this.mdkModel,
  }) : super(key: mkey);

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
                  image: NetworkImage(mdkModel.get('*Insert Name of Firestore Document Field With Firebase Storage Photo Downloadurl*')),
                  fit: BoxFit.cover)),
        ));
  }
}
