import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  String? uid;
  String? name;
  String? userEmail;
  String? imageUrl;

  /// For checking if the user is already signed into the
  /// app using Google Sign In
  Future getUser() async {
    await Firebase.initializeApp();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;

    final User? user = _auth.currentUser;

    if (authSignedIn == true) {
      if (user != null) {
        uid = user.uid;
        name = user.displayName;
        userEmail = user.email;
        imageUrl = user.photoURL;
      }
    }
  }


//SIGN UP METHOD
  Future<String?> registerWithEmailPassword(String email, String password) async {
    await Firebase.initializeApp();
    // User? user;

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

     return "Success";
      //
      // if (user != null) {
      //   uid = user.uid;
      //   userEmail = user.email;
      // }
    } on FirebaseAuthException catch (e) {
      return e.code;

    } catch (e) {
      return "other error";
    }
  }

//SIGN IN METHOD
  Future<User?> signInWithEmailPassword(String email, String password, BuildContext context) async {
    await Firebase.initializeApp();
    User? user;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      if (user != null) {
        uid = user.uid;
        userEmail = user.email;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('auth', true);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "No user found for that email",
              style: TextStyle(fontSize: 16),
            )));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Wrong password provided",
              style: TextStyle(fontSize: 16),
            )));
      }
    }

    return user;
  }

//SIGN OUT METHOD
  Future<String> signOut() async {
    await _auth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);

    uid = null;
    userEmail = null;

    return 'User signed out';
  }

}