import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Question>> fetchQuestions(String grade, String subject, String topic, String level) async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection('grades')
          .doc(grade)
          .collection('subjects')
          .doc(subject)
          .collection('topics')
          .doc(topic)
          .collection('levels')
          .doc(level)
          .collection('questions')
          .get();
      
      return snapshot.docs.map((doc) => Question.fromDocument(doc)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Question?> fetchQuestion(String grade, String subject, String topic, String level, String questionId) async {
    try {
      final DocumentSnapshot doc = await _firestore
          .collection('grades')
          .doc(grade)
          .collection('subjects')
          .doc(subject)
          .collection('topics')
          .doc(topic)
          .collection('levels')
          .doc(level)
          .collection('questions')
          .doc(questionId)
          .get();
      
      if (doc.exists) {
        return Question.fromDocument(doc);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
