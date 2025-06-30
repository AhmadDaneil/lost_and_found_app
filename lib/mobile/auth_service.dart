import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:lost_and_found_app/home.dart';
import 'package:lost_and_found_app/login.dart';

class AuthService {

  Future<void> signUp({
    required String email,
    required String password
  }) async {

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
        );
    }on FirebaseAuthException catch(e){
      String message = '';
      if (e.code == 'weak-password'){
        message = 'The password is too weak.';
      } else if (e.code == 'email-already-in-use'){
        message = 'An account already exist with that email.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }
  Future<void> signIn({
      required String email,
      required String password,
      required BuildContext context,

    }) async{

      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, 
          password: password
          );
        
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushReplacement(context, 
        MaterialPageRoute(
          builder: (BuildContext context) => const Home()),
        );
      } on FirebaseAuthException catch(e){
        String message = '';
        if (e.code == 'invalid-email'){
        message = 'No user found for that email';
      } else if (e.code == 'invalid-credential'){
        message = 'Wrong password provided';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0,
      );
      }
    }

    Future<void> signOut({
      required BuildContext context
    }) async{

      await FirebaseAuth.instance.signOut();
      await Future.delayed(const Duration (seconds: 1));
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (BuildContext context) => Login()
          )
      );
    }
}