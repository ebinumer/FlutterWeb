import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_circle/screens/home_page.dart';
import 'package:share_circle/screens/login.dart';

import '../utils/authentication.dart';

class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Color(0xFFf5f5f5),
          body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8),
            children: [
              Menu(),
              // MediaQuery.of(context).size.width >= 980
              //     ? Menu()
              //     : SizedBox(), // Responsive
              Body()
            ],
          ),);



  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              _menuItem(title: 'REGISTER', isActive: true),
              _loginButton(context)
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({String title = 'Title Menu', isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.deepPurple : Colors.grey,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            isActive
                ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(30),
              ),
            )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: (Colors.grey[200])!,
            spreadRadius: 10,
            blurRadius: 12,
          ),
        ],
      ),
      child:  GestureDetector(
        onTap: () {
          print(MediaQuery.of(context).size.width);
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );

        },
        child: const Text(
          'LOGIN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Register to \nMy Share Circle',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "If you  have an account",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "You can",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      "Login here!",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/reading.png',
                width: 300,
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6),
          child: Container(
            width: 320,
            child: _formLogin(context),
          ),
        )
      ],
    );
  }

  Widget _formLogin(BuildContext context) {
    final _usernameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _mobileController = TextEditingController();
    final _addressController = TextEditingController();
    return Column(
      children: [


        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: 'Enter name',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _addressController,
          decoration: InputDecoration(
            hintText: 'Enter Address',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _mobileController,
          decoration: InputDecoration(
            hintText: 'Enter Mobile Number',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Enter email',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: 'Password',
            suffixIcon: const Icon(
              Icons.visibility_off_outlined,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),

              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: (Colors.deepPurple[100])!,
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () async  {
              if(_emailController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Enter email",
                      style: TextStyle(fontSize: 16),
                    )));
              }
              else if(_passwordController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Enter Password",
                      style: TextStyle(fontSize: 16),
                    )));
              }
              else {
                AuthenticationHelper()
                    .registerWithEmailPassword(
                    _emailController.text, _passwordController.text)
                    .then((result) {
                  if (result == "Success") {
                    FirebaseFirestore.instance
                        .collection('register')
                        .add({
                      'email': _emailController.text,
                      'Mobile': _mobileController.text,
                      'address': _addressController.text,
                      'userName': _usernameController.text,
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                  else {
                    if (result == 'weak-password') {
                      print('The password provided is too weak.');
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                            "The password provided is too weak",
                            style: TextStyle(fontSize: 16),
                          )));
                    } else if (result == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                            "email-already-in-use",
                            style: TextStyle(fontSize: 16),
                          )));
                      print('The account already exists for that email.');
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        result!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ));
                  }
                });
              }
    },
             style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(child: Text("REGISTER"))),
          ),
        ),
        const SizedBox(height: 40),

      ],
    );
  }


}
