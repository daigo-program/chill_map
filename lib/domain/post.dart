import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Post(DocumentSnapshot doc) {
    documentID = doc.documentID;
    sentence = doc.data()['sentence'];
  }

  String sentence;
  String documentID;
}
