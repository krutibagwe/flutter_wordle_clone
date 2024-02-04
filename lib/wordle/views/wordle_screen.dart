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

  int _currentWordIndex =0;

  Word? get _currentWord =>
    _currentWordIndex < _board.length ? _board[_currentWordIndex] : null;

  Word _solution = Word.fromString (
    fiveLetterWords[Random().nextInt(fiveLetterWords.length)].toUpperCase(),
  );

  @override
  Widget build(BuildContext context){
    return Scaffold (
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'WORDLE',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 4
          ),
        )
      )
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Board(board: _board),
          const SizedBox(height: 80),
          Keyboard(
            onKeyTapped: _onKeyTapped,
            onDeleteTapped: _onDeteleTapped,
            onEnterTapped: _onEnterTapped,
          ),
        ],
      ),
    );
  }

  void _onKeyTapped(String val){
    if (_gameStatus == GameStatus.playing){
      setState(()=> _currentWord?.addLetter(val));
    }
  }

void _onDeteleTapped(){
  if (_gameStatus == GameStatus.playing){
    setState(()=> _currentWord?.removeLetter());
  }
}

void _onEnterTapped(){
  if (_gameStatus == GameStatus.playing &&
    _currentWord != null &&
    !_currentWord!.letters.contains(Letter.empty())){
      _gameStatus = GameStatus.submitting;

      for (var i=0; i< _currentWord!.letters.length; i++){
        final currentWordLetter = _currentWord!.letters[i];
        final currentSolutionLetter = _solution.letters[i];
      }
    }
  }

}
