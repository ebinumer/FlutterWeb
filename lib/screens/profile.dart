import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_circle/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState()
  {
    return _ProfilePageState();
  }
}
class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        leading: null,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children: [
          Body()
        ],
      ),);



  }

}


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  late SharedPreferences prefs;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  late var email;

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
                'Welcome to \nMy Profile',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "All about my account",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/profile.png',
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

    email = prefs.getString("email");
retrieve();
    return Column(
      children: [


        TextField(
          controller: _usernameController,
          enabled: false,
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
          enabled: false,
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
          enabled: false,
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
          enabled: false,
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
        const SizedBox(height: 40),


      ],
    );

  }

  retrieve() async{
    prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email");
    setState(() {
print(email);
    });
  }
}