import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Question>> fetchQuestions() async {
    const String collectionName = 'questions';
    try {
      final QuerySnapshot snapshot =
          await _firestore.collection(collectionName).get();
      return snapshot.docs.map((doc) => Question.fromDocument(doc)).toList();
    } 
    catch (e) {
      print(e);
      throw e;
    }
  }
}
