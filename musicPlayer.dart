// <-----------Main Page ------------>
import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spanish Number',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
// <-------- Home Page ----------->
import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "one"),
    NumberAudio("two.wav", Colors.red, "two"),
    NumberAudio("three.wav", Colors.red, "three"),
    NumberAudio("four.wav", Colors.red, "four"),
    NumberAudio("five.wav", Colors.red, "five"),
    NumberAudio("six.wav", Colors.red, "six"),
    NumberAudio("seven.wav", Colors.red, "seven"),
    NumberAudio("eight.wav", Colors.red, "eight"),
    NumberAudio("nine.wav", Colors.red, "nine"),
    NumberAudio("ten.wav", Colors.red, "ten"),
  ];

  play(String uri) {
    final audio = AudioCache();
    audio.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spanish Numbers'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Image(image: AssetImage("images/logo.png")),
              Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: numberList.length,
                    itemBuilder: (context, i) => SizedBox(
                          width: 100.0,
                          height: 50.0,
                          child: MaterialButton(
                            color: numberList[i].buttonColor,
                            child: Text(
                              numberList[i].buttonText,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              play(numberList[i].audioUri);
                            },
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// <-------- Number Audio ----------->
import 'package:flutter/material.dart';

class NumberAudio {
  String audioUri = "";
  MaterialColor buttonColor = Colors.blue;
  String buttonText = "";

  NumberAudio(String aU, MaterialColor bC, String bT) {
    this.audioUri = aU;
    this.buttonColor = bC;
    this.buttonText = bT;
  }
}
