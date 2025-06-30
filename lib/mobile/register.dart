import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController name=TextEditingController();

  signUp() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      User? user = userCredential.user;
      if(user != null){
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': name.text.trim(),
        'email': email.text.trim(),
        'uid': userCredential.user!.uid,
      });
      await user.updateDisplayName(name.text.trim());
      }
    } catch (e){
      Get.snackbar('Register Error' , e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text("Sign Up"),
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => Get.back(),
    color: Colors.black, // ⬅️ manual back
  ),
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 120),
          Form(
              child: Column(
                children: [
                  TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter name' : null;
                      },
                    ),
                    const SizedBox(height: 15),
                  TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter email' : null;
                      },
                    ),
                    const SizedBox(height: 15),
                  TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter password' : null;
                      },
                    ),
                    const SizedBox(height: 30),
                  
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => signUp(),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    child: const Text('Sign Up'),
                    ),
                  )
                ]
          )
          )
                ],
              ),
      )
      );
  }
}