import 'dart:typed_data';

import 'package:c_man_mobapp/models/post.dart';
import 'package:c_man_mobapp/services/store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethodes {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //uploadPost
  Future<String> uploadPoast(
    Uint8List file,
    String description,
    String uid,
    String userName,
    String profileImage,
  ) async {
    String res = "some error occured";
    try {
      //first store the image in the firebase storage and get the URL of the image

      String photoURL =
          await StorageMethodes().uploadImage("posts", true, file);

      //crete a post id here v4 is genarated from a random number
      String postId = const Uuid().v4();
      //create the post
      Post post = Post(
        description: description,
        uid: uid,
        userName: userName,
        postId: postId,
        datePosted: DateTime.now(),
        postURL: photoURL,
        profilePic: profileImage,
      );

      //upload to the firabase
      _firestore.collection('posts').doc(postId).set(post.toJSON());

      res = "success";
    } catch (error) {
      res = error.toString();
    }

    return res;
  }
}