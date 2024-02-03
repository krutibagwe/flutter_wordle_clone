import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/wordle/wordle.dart';

enum GameStatus { playing, submitting, lost, won}

class WordleScreen extends StatefulWidget{
  const WordleScreen({ Key? key}) : super(key: key);

  @override
  _WordleScreenState createState() => _WordleScreenState();
}

class _WordleScreenState extends State<WordleScreen> {
  GameStatus _gameStatus = GameStatus.playing;

  final List<Word> _board = List.generate(
    6,
    (_) => Word(letters: List.generate(5, (_) => Letter.empty())),
  );

  @override
  Widget build(BuildContext context){
    return Container (

    );
  }
}