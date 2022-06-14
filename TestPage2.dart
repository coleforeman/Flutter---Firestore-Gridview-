import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yourprojectname/Views/UserPages/TestSubPage1.dart';

class TestPage2 extends StatefulWidget {
  @override
  _TestPageHomeState2 createState() => _TestPageHomeState2();
}

class _TestPageHomeState2 extends State<TestPage2>
    with SingleTickerProviderStateMixin {
  AnimationController anConMk2;
  

  @override
  void initState() {
    super.initState();
    anConMk2 = AnimationController(
      duration: const Duration(seconds: 12),
      vsync: this,
    )..repeat();
  }

  Animatable<Color> background = TweenSequence<Color>([
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
        animation: anConMk2,
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
                          .evaluate(AlwaysStoppedAnimation(anConMk2.value))),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('*Insert your Firestore Collection Name Here*')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else
                          return GridView.count(
                              primary: false,
                              padding: const EdgeInsets.all(20),
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              crossAxisCount: 2,
                              children: List.generate(snapshot.data.docs.length,
                                  (index) {
                                return InkWell(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data.docs[index]
                                                    .get('*Insert Name of Firestore Document Field With Firebase Storage Photo Downloadurl*')),
                                                fit: BoxFit.cover))),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ItemPageDetailView2(
                                                    itModel: snapshot
                                                        .data.docs[index]))));
                              }));
                      })));
        });
  }
   @override
        void dispose() {
          anConMk2.dispose();
          super.dispose();
        }
}
