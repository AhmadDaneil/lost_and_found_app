import 'package:flutter/material.dart';
import 'package:lost_and_found_app/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => Login(),
    },
  ));
}

