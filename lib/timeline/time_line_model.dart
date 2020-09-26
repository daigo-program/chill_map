import 'package:chill_map/domain/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TimeLineModel extends ChangeNotifier {
  List<Post> posts = [];

  Future fetchPosts() async {
    final docs = await FirebaseFirestore.instance.collection('posts').get();
    final posts = docs.docs.map((doc) => Post(doc.data()['sentence'])).toList();
    this.posts = posts;
    notifyListeners();
  }
}
