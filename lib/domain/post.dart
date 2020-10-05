import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Post(DocumentSnapshot doc) {
    documentID = doc.id;
    sentence = doc.data()['sentence'];
    spot = doc.data()['spot'];
  }

  String sentence;
  String documentID;
  String spot;
}
