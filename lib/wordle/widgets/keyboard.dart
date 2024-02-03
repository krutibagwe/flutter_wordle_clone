import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';

const _qwerty = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
];

class Keyboard extends StatelessWidget {
  const Keyboard({ 
    Key? key,
    required this.onKeyTapped,
    required this.onDeleterTapped,
    required this.onEnterTapped,
    }) : super(key: key);

  final void Function(String) onKeyTapped;
  
  final VoidCallback onDeleterTapped;

  final VoidCallback onEnterTapped;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _qwerty
        .map(
          (keyRow) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: keyRow.map(
              (letter) {
                if (letter == 'DEL'){
                  return _KeyboardButton.delete(onTap: onDeleterTapped);
                } else if (letter == 'ENTER'){
                  return _KeyboardButton(
                    onTap: () => onKeyTapped(letter),
                  )letter: letter,
                  backgroundColor: Colors.grey,
                };
              },
            ).toList(),
          ),
        )
        .toList(),
    );
  }
}

class _KeyboardButton extends StatelessWidget{
  const _KeyboardButton({
    Key? key,
    this.height = 48,
    this.width = 30,
    required this.onTap,
    required this.backgroundColor,
    required this.letter,
     }) : super(key: key);

     final double height;

     final double width;

     final VoidCallback onTap;

     final Color backgroundColor;

     final String letter;

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}