import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:share_circle/screens/books/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

import '../checkout/checkout_view.dart';


class BooksPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _BookState();
}

class _BookState extends State<BooksPage> {

  late List<String> _choices;
  late int _choiceIndex;


  @override
  void initState() {
    super.initState();
    _choiceIndex = 0;

    _choices = ["Common","Mechanical Engineering",
      "Information Technology","Computer Engineering","Electrical Engineering",
      "Electronics Engineering",];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        leading: null,
        title: const Text("Books", style: TextStyle(color: Colors.black, fontSize: 25),),
        actions:  <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black,), onPressed: () { print("clicked"); },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black,), onPressed: () {  },
          )
        ], systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              _buildChoiceChips(),
              _mitem(_choiceIndex),
      ]),
    )));
  }

  Widget makeItem({count, tag, context,name,category,sem,price}) {

    return Hero(
      tag: tag,
      child: GestureDetector(
        // onTap: () => redirectToCheckout(context),
        onTap: () {
          // CheckoutView("demo","200");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutView(name,price),
          ));
        },
        child: Container(
          height: 230,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: tag,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: (Colors.grey[400])!,
                blurRadius: 10,
                offset: const Offset(0, 10)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1, Text(name, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                        const SizedBox(height: 10,),
                        FadeAnimation(1.1, Text(category, style: const TextStyle(color: Colors.white, fontSize: 20),)),
                        const SizedBox(height: 10,),
                        FadeAnimation(1.1, Text(sem, style: const TextStyle(color: Colors.white, fontSize: 20),)),

                      ],
                    ),
                  ),
                  FadeAnimation(1.2, Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: const Center(
                      child: Icon(Icons.favorite_border, size: 20,),
                    ),
                  )),
                ],
              ),
              FadeAnimation(1.2, Text("₹"+price, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildChoiceChips() {
    return SizedBox(
      height: MediaQuery.of(context).size.height/8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _choices.length,

        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              label: Text(_choices[index]),
              selected: _choiceIndex == index,
              selectedColor: Colors.red,
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex = selected ? index : 0;

                });
              },
              backgroundColor: Colors.green,
              labelStyle: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  Widget _mitem(item){
    if(item == 1){
      return  StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Mechanical Engineering').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
             if(snapshot.data?.size==0){
                    return const Center(
                    child: Text("No Items In Mechanical Engineering"),
                  );
               }
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((document) {

                return FadeAnimation(1.5, makeItem(count:_choiceIndex,tag: Colors.red,
                    context: context,
                    name: document['Name'],
                    category: document['Department'],
                    sem: document['Semester'],
                    price: document['Price']));

              }

              ).toList(),

            );



          });
    }
    if(item == 2){
      return  StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Information Technology').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data?.size==0){
              return const Center(
                child: Text("No Items In Information Technology"),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((document) {

                return FadeAnimation(1.5, makeItem(count:_choiceIndex,tag:Colors.green,
                    context: context,
                    name: document['Name'],
                    category: document['Department'],
                    sem: document['Semester'],
                    price: document['Price']));

              }

              ).toList(),

            );



          });
    }
    if(item == 3){
      return  StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Computer Engineering').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data?.size==0){
              return const Center(
                child: Text("No Items In Computer Engineering"),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((document) {

                return FadeAnimation(1.5, makeItem(count:_choiceIndex,tag: Colors.deepOrange,
                    context: context,
                    name: document['Name'],
                    category: document['Department'],
                    sem: document['Semester'],
                    price: document['Price']));

              }

              ).toList(),

            );



          });
    }
    if(item == 4){
      return  StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Electrical Engineering').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data?.size==0){
              return const Center(
                child: Text("No Items In Electrical Engineering"),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((document) {

                return FadeAnimation(1.5, makeItem(count:_choiceIndex,tag: Colors.deepPurple,
                    context: context,
                    name: document['Name'],
                    category: document['Department'],
                    sem: document['Semester'],
                    price: document['Price']));

              }

              ).toList(),

            );



          });
    }
    if(item == 5){
      return  StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Electronics Engineering').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data?.size==0){
              return const Center(
                child: Text("No Items In Electronics Engineering"),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((document) {

                return FadeAnimation(1.5, makeItem(count:_choiceIndex,tag: Colors.pink,
                    context: context,
                    name: document['Name'],
                    category: document['Department'],
                    sem: document['Semester'],
                    price: document['Price']));

              }

              ).toList(),

            );



          });
    }
    else{
      return  StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Common').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data?.size==0){
              return const Center(
                child: Text("No Items In Common Books"),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((document) {

                return FadeAnimation(1.5, makeItem(count:_choiceIndex,tag: Colors.blue,
                    context: context,
                    name: document['Name'],
                    category: document['Department'],
                    sem: document['Semester'],
                    price: document['Price']));

              }

              ).toList(),

            );



          });
    }

  }

}
