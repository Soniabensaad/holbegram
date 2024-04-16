import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String email;
  String username;
  String bio;
  String photoUrl;
  List<dynamic> followers;
  List<dynamic> following;
  List<dynamic> posts;
  List<dynamic> saved;
  String searchKey;

  User(
    this.uid,
    this.email,
    this.username,
    this.bio,
    this.photoUrl,
    this.followers,
    this.following,
    this.posts,
    this.saved,
    this.searchKey,
  );

  static User fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return User(
      data['uid'] ?? '',
      data['email'] ?? '',
      data['username'] ?? '',
      data['bio'] ?? '',
      data['photoUrl'] ?? '',
      List<dynamic>.from(data['followers'] ?? []),
      List<dynamic>.from(data['following'] ?? []),
      List<dynamic>.from(data['posts'] ?? []),
      List<dynamic>.from(data['saved'] ?? []),
      data['searchKey'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'bio': bio,
      'photoUrl': photoUrl,
      'followers': followers,
      'following': following,
      'posts': posts,
      'saved': saved,
      'searchKey': searchKey,
    };
  }
}
