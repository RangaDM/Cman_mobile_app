import 'dart:typed_data';

import 'package:c_man_mobapp/models/user_model.dart';
import 'package:c_man_mobapp/services/store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart' as user_model;

class AuthMethodes {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<user_model.UserModel> getCurrentUser() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return user_model.UserModel.fromJson(
        snapshot.data() as Map<String, dynamic>);
  }

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

        String photoURL = await StorageMethodes()
            .uploadImage("ProfileImages", false, propic);

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
    } on FirebaseAuthException catch (e) {
      res = e.toString();
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String res = "An error occured";

    try {
      //if the inputs are not empty
      if (email.isNotEmpty && password.isNotEmpty) {
        //login the user with email and password
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      } else {
        res = "Please enter email and password";
      }
    }

    //catch the errors extra error handling
    on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        res = "Invalid email";
      } else if (error.code == "weak-password") {
        res = "Weak password";
      } else if (error.code == "email-already-in-use") {
        res = "Email already in use";
      }
    } catch (error) {
      res = error.toString();
    }

    return res;
  }

  //sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
