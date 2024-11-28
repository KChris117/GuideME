import 'package:cloud_firestore/cloud_firestore.dart';


class Comment {
  final String username;
  final String comment;
  final Timestamp timestamp;

  Comment({
    required this.username,
    required this.comment,
    required this.timestamp,
  });

  factory Comment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Comment(
      username: data['username'],
      comment: data['comment'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'comment': comment,
      'timestamp': timestamp,
    };
  }
}
