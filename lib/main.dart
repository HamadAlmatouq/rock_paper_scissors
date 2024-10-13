import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String player1Choice = 'assets/Images/1.png';
  String player2Choice = 'assets/Images/1.png';
  String result = ""; //to hold result

  void play() {
    //Generate random numbers 1-3 for both players
    int player1 = Random().nextInt(3) + 1;
    int player2 = Random().nextInt(3) + 1;

    //
    setState(() {
      player1Choice = "assets/Images/$player1.png";
      player2Choice = "assets/Images/$player2.png";

      //Winner ?
      if (player1 == player2) {
        result = "Tie!";
      } else if (
          //cases where player 1 wins
          (player1 == 1 && player2 == 3) ||
              (player1 == 2 && player2 == 1) ||
              (player1 == 3 && player2 == 2)) {
        result = "Player 1 Wins!";
      } else {
        result = "Player 2 Wins!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ROCK PAPER SCISSORS",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  player1Choice,
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 70), //Space between images
                Image.asset(
                  player2Choice,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            SizedBox(height: 30), // Space above the result text
            Text(
              result,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 70), // Space above the button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: play,
              child: Text(
                "Play",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
