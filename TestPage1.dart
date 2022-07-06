import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:*yourprojectname*/TestSubPage1.dart';

class TestPage1 extends StatefulWidget {
  @override
  _TestPageHomeState createState() => _TestPageHomeState();
}

class _TestPageHomeState extends State<TestPage1>
    with SingleTickerProviderStateMixin {
  late AnimationController anConMk;

  @override
  void initState() {
    super.initState();
    anConMk = AnimationController(
      duration: const Duration(seconds: 12),
      vsync: this,
    )..repeat();
  }

  Animatable<Color?> background = TweenSequence<Color?>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.red,
        end: Colors.green,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.green,
        end: Colors.blue,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.blue,
        end: Colors.yellow,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.yellow,
        end: Colors.red,
      ),
    ),
  ]);

  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: anConMk,
        builder: (context, child) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Icon(Icons.science),
                flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(begin: Alignment.topLeft, colors: [
                  Colors.blue,
                  Colors.green,
                  Colors.red,
                  Colors.yellow,
                ]))),
              ),
              body: Container(
                  decoration: BoxDecoration(
                      color: background
                          .evaluate(AlwaysStoppedAnimation(anConMk.value))),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('*collectionpath*')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.data == null) {
                          return Center(child: CircularProgressIndicator());
                        } else
                          return GridView.count(
                              primary: false,
                              padding: const EdgeInsets.all(20),
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              crossAxisCount: 2,
                              children: List.generate(
                                  snapshot.data!.docs.length, (index) {
                                return InkWell(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    snapshot.data!.docs[index]
                                                        ['itemImageOne']),
                                                fit: BoxFit.cover))),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ItemPageDetailView(
                                                    mdkModel: snapshot
                                                        .data!.docs[index]))));
                              }));
                      })));
        });
  }

  @override
  void dispose() {
    anConMk.dispose();
    super.dispose();
  }
}
