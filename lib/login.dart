import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyAppState();
}

class _MyAppState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'FoundIt',
              style: TextStyle(
                fontSize: 35,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Form(
                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(), 
                        ),
                        onChanged: (String value) {
                                    
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter email' : null; 
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(), 
                        ),
                        onChanged: (String value) {
                                    
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter password' : null; 
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:35),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed:(){},
                        child: Text('Login'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        ),
                    )

                  ],
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}