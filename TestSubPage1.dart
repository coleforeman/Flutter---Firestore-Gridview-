import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemPageDetailView extends StatelessWidget {
  final DocumentSnapshot mdkModel;

  const ItemPageDetailView({
    Key? mkey,
    required this.mdkModel,
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
                  image: NetworkImage(mdkModel.get('')), fit: BoxFit.cover)),
        ));
  }
}
