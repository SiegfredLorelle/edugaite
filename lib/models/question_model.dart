// question_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String id;
  final String question;
  final List<String> choices;
  final String answer;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Question({
    required this.id,
    required this.question,
    required this.choices,
    required this.answer,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Question.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Question(
      id: doc.id,
      question: data['question'] ?? '',
      choices: List<String>.from(data['choices'] ?? []),
      answer: data['answer'] ?? '',
      createdAt: data['createdAt'] ?? Timestamp.now(),
      updatedAt: data['updatedAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'question': question,
      'choices': choices,
      'answer': answer,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
