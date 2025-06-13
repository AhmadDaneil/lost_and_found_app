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
        
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/crumbled paper.jpg'),
                fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'FoundIt',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
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
                        decoration: const InputDecoration(
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
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
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
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:35),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed:(){},
                        child: const Text('Login'),
                        color: Colors.white,
                        textColor: Colors.black,
                        ),
                    ),
                    
                  ],
                  
                
                ),
                ),
            ),
          ],
                )
              ),
          
          )
        ),
      );
  }
}