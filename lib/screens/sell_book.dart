import 'dart:io';
import 'dart:js';
import 'dart:html' as html;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_circle/screens/home_page.dart';


class SellPage extends StatelessWidget {
  const SellPage({Key? key}) : super(key: key);
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
          MyInputPage( context)
        ],
      ),

    );
  }




}
class MyInputPage extends StatefulWidget {
  const MyInputPage(BuildContext context, {Key? key}) : super(key: key);
  // const MyInputPage(BuildContext context);

  @override
  Body createState() => Body(context);
}
class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [

          // Row(
          //   children: [
          //     _menuItem(title: 'Sell Book', isActive: true),
          //   ],
          // ),
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
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(30),
              ),
            )
                : const SizedBox()
          ],
        ),
      ),
    );
  }


}

class Body extends  State<MyInputPage> {


  String branchValue = 'select Branch';
  String semesterValue = 'select Semester';
  var semester = [
    'select Semester',
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
  ];
  var branch = [
    'select Branch',
    'Automobile Engineering',
    'Civil Engineering',
    'Computer Science and Engineering',
    'Electrical and Electronics Engineering',
    'Mechanical Engineering',
    'Semester 6',
  ];



  Body(JsObject context);
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
                'Sell Your Books through \nShare Circle',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "You can sell here",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),

              Image.asset(
                'assets/images/sell.png',
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
            child: _formSell(context),
          ),
        )
      ],
    );
  }

  Widget _formSell(BuildContext context) {

    final _bookNameController = TextEditingController();
    final _PriceController = TextEditingController();
    final _ownerController = TextEditingController();
    return Column(
      children: [
      Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
      color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(10)),

      // dropdown below..
      child:
        DropdownButton(
          value: branchValue,
          underline: const SizedBox.shrink(),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: branch.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              branchValue = newValue!;
            });
          },
        ),
      ),
        const  SizedBox(height: 30),
        Container(
          width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
        color: Colors.blueGrey[50], borderRadius: BorderRadius.circular(10)),

        // dropdown below..
        child:
            DropdownButton(
              value: semesterValue,
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.keyboard_arrow_down),

              items: semester.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  semesterValue = newValue!;
                });
              },
            ),
    ),


        const SizedBox(height: 30),
        TextField(
          controller:_bookNameController,
          decoration: InputDecoration(
            hintText: 'Book Name',
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
          controller: _PriceController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Price',
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
          controller: _ownerController,
          decoration: InputDecoration(
            hintText: 'Seller Name',
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
            onPressed: () {

              if(branchValue=="select Branch"){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Select a branch",
                      style: TextStyle(fontSize: 16),
                    )));
              }
              else if(semesterValue=='select Semester'){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Select a semester",
                      style: TextStyle(fontSize: 16),
                    )));
              }
              else if(_bookNameController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Input Book Name",
                      style: TextStyle(fontSize: 16),
                    )));
              }
              else if(_PriceController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Input Book Price",
                      style: TextStyle(fontSize: 16),
                    )));
              }
              else if(_ownerController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Input Owner name",
                      style: TextStyle(fontSize: 16),
                    )));
              }
              else{
              FirebaseFirestore.instance
                  .collection('books')
                  .add({
              'Department': branchValue,
              'Name': _bookNameController.text,
              'Price': _PriceController.text,
              'Semester': semesterValue,
              'owner': _ownerController.text,
              });
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
              "Book Added Successfully",
              style: TextStyle(fontSize: 16),
              )));
              Navigator.pop(context);
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
                child: Center(child: Text("Submit"))),
          ),
        ),
        const SizedBox(height: 40),

      ],
    );
  }


}
