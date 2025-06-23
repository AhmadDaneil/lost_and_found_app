import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found_app/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MaterialApp(
    title: 'FoundIt',
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
  
}

