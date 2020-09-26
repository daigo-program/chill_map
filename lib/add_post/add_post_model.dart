import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddPostModel extends ChangeNotifier {
  String postSentence = '';

  Future addPostToFireBase() async {
    if (postSentence.isEmpty) {
      throw ('内容を入力してね');
    }

    FirebaseFirestore.instance.collection('posts').add({
      'sentence': postSentence,
      'createdAt': Timestamp.now(),
    });
  }
}
