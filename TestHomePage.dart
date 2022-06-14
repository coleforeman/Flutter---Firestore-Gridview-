import 'package:flutter/material.dart';
import 'package:minervaproject/Views/UserMainPages/TestPage1.dart';
import 'package:minervaproject/Views/UserMainPages/TestPage2.dart';

class TestHome extends StatefulWidget {
  @override
  CreateHomeState createState() => CreateHomeState();
}

class CreateHomeState extends State<TestHome> with SingleTickerProviderStateMixin {
  AnimationController anCon;
  @override
  void initState() {
    super.initState();
    anCon = AnimationController(
      duration: const Duration(seconds: 10),
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
        animation: anCon,
        builder: (context, child) {
          return Scaffold(
             
              //<=============================================================================================>
              appBar: AppBar(
                centerTitle: true,
                title: Icon(Icons.home_outlined),
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
              //<=============================================================================================>
              body: Container(
                decoration: BoxDecoration(
                    color: background
                        .evaluate(AlwaysStoppedAnimation(anCon.value))),
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 7, 
                  mainAxisSpacing: 7,
                  crossAxisCount: 2,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          padding: const EdgeInsets.all(30),
                          child: Center(
                            child: Icon(
                              Icons.science,
                              color: Colors.white,
                              size: 80.0,
                            ),
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestPage1()));
                      },
                    ),
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                             color: Colors.red,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          padding: const EdgeInsets.all(30),
                          child: Center(
                            child: Icon(
                              Icons.science_outlined,
                              color: Colors.white,
                              size: 80.0,
                            ),
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestPage2()));
                      },
                    ),
                  
                    
                  ],
                ),
              ));
        });}}