// <--------- Main Page ---------->
import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice ROller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
//<---------- Home Page ---------->
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = AssetImage("images/Suj.jpg");
  AssetImage two = AssetImage("images/VJ.jpg");
  AssetImage three = AssetImage("images/SC.jpg");
  AssetImage four = AssetImage("images/SR.jpg");
  AssetImage five = AssetImage("images/Ish.jpg");
  AssetImage six = AssetImage("images/SD@.jpg");

  AssetImage diceImage = AssetImage("images/white.jpg");
  AssetImage diceImage1 = AssetImage("images/white.jpg");

  @override
  void initState() {
    super.initState();
    setState(() {
      diceImage = one;
      diceImage1 = one;
    });
  }

  void rollDice() {
    int rnd = (1 + Random().nextInt(6));
    int rnd1 = (1 + Random().nextInt(6));

    AssetImage newImage = AssetImage("images/white.jpg");
    AssetImage newImage1 = AssetImage("images/white.jpg");

    switch (rnd) {
      case 1:
        newImage = one;
        break;
      case 2:
        newImage = two;
        break;
      case 3:
        newImage = three;
        break;
      case 4:
        newImage = four;
        break;
      case 5:
        newImage = five;
        break;
      case 6:
        newImage = six;
        break;
    }
    switch (rnd1) {
      case 1:
        newImage1 = one;
        break;
      case 2:
        newImage1 = two;
        break;
      case 3:
        newImage1 = three;
        break;
      case 4:
        newImage1 = four;
        break;
      case 5:
        newImage1 = five;
        break;
      case 6:
        newImage1 = six;
        break;
    }
    setState(() {
      diceImage = newImage;
      diceImage1 = newImage1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: diceImage,
              width: 170.0,
              height: 170.0,
            ),
            Text("   "),
            Text("   "),
            Image(
              image: diceImage1,
              width: 170.0,
              height: 170.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                child: ElevatedButton(
                  child: Text('Roll!!'),
                  onPressed: rollDice,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
