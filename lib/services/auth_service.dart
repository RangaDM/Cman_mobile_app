import 'dart:typed_data';
import 'package:c_man_mobapp/models/user_model.dart';
import 'package:c_man_mobapp/services/store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethodes {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber,
      required String address,
      required Uint8List propic}) async {
    String res = "An error occured";

    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          userName.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          address.isNotEmpty &&
          propic.isNotEmpty) {
        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoURL = await StorageMethodes().uploadImage(
          path: "profileImages",
          isPost: false,
          file: propic,
        );

        UserModel user = UserModel(
          uid: userCredential.user!.uid,
          username: userName,
          email: email,
          password: password,
          phone: phoneNumber,
          address: address,
          propic: photoURL,
          token: "",
          followers: [],
          following: [],
        );

        if (userCredential.user != null) {
          await _firestore
              .collection("users")
              .doc(_auth.currentUser!.uid)
              .set(user.toJSON());
              res = "User Registration Successful";
        } else {
          res = "User Registration Failed";
        }
      } else {
        res = "Please fill all the fields";
      }
    }
    on FirebaseAuthException catch (e) {
      res = e.toString();
    }
     catch (e) {
      res = e.toString();
    }
    return res;
  }
}
