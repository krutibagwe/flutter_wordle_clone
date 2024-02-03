import 'package:equatable/equatable.dart';

enum LetterStatus {initial, notInWord, inWord, correct}

class Letter extends Equatable {
  const Letter({
    required this.val,
    this.status = LetterStatus.initial,
  });

  factory Letter.empty() => const Letter(val: '');

  final String val;

  final LetterStatus status;
}