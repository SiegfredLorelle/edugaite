// question_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String id;
  final String question;
  final List<String> choices;
  final String correct_answer;
  final Timestamp created_at;
  final Timestamp updated_at;

  Question({
    required this.id,
    required this.question,
    required this.choices,
    required this.correct_answer,
    required this.created_at,
    required this.updated_at,
  });

  factory Question.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Question(
      id: doc.id,
      question: data['question'] ?? '',
      choices: List<String>.from(data['choices'] ?? []),
      correct_answer: data['correct_answer'] ?? '',
      created_at: data['created_at'] ?? Timestamp.now(),
      updated_at: data['updated_at'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'question': question,
      'choices': choices,
      'answer': correct_answer,
      'createdAt': created_at,
      'updatedAt': updated_at,
    };
  }
}
