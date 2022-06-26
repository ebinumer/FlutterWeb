import 'package:flutter/services.dart';
import 'package:share_circle/screens/books/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';


class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: FadeAnimation(1, Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Center(
                          child: Text("All", style: TextStyle(fontSize: 20),),
                        ),
                      )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: FadeAnimation(1.1, Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Center(
                          child: Text("Common", style: TextStyle(fontSize: 14),),
                        ),
                      )),
                    ),
                    AspectRatio(
                      aspectRatio: 4.2/1,
                      child: FadeAnimation(1.2, Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Center(
                          child: Text("Mechanical Engineering", style: TextStyle(fontSize: 14),),
                        ),
                      )),
                    ),
                    AspectRatio(
                      aspectRatio: 4.2/1,
                      child: FadeAnimation(1.3, Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Center(
                          child: Text("Information Technology", style: TextStyle(fontSize: 14),),
                        ),
                      )),
                    ),
                    AspectRatio(
                      aspectRatio: 4.2/1,
                      child: FadeAnimation(1.4, Container(
                        margin: EdgeInsets.only(right: 10),
                        child: const Center(
                          child: Text("Computer Engineering", style: TextStyle(fontSize: 14),),
                        ),
                      )),
                    ),
                    AspectRatio(
                      aspectRatio: 4.2/1,
                      child: FadeAnimation(1.4, Container(
                        margin: EdgeInsets.only(right: 10),
                        child: const Center(
                          child: Text("Electrical Engineering", style: TextStyle(fontSize: 14),),
                        ),
                      )),
                    ),
                    AspectRatio(
                      aspectRatio: 4.2/1,
                      child: FadeAnimation(1.4, Container(
                        margin: EdgeInsets.only(right: 10),
                        child: const Center(
                          child: Text("Electronics Engineering", style: TextStyle(fontSize: 14),),
                        ),
                      )),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              FadeAnimation(1.5, makeItem(image: 'assets/images/chemistry.webp', tag: 'red', context: context,name:"Engineering chemistry",sem: "2st Semester",price:"Rs : 250" )),
              FadeAnimation(1.6, makeItem(image: 'assets/images/design.jpg', tag: 'blue', context: context,name:"Design engineering",sem: "2st Semester",price:"Rs : 350"  )),
              FadeAnimation(1.7, makeItem(image: 'assets/images/physics.jpg', tag: 'white', context: context,name:"Engineering physics",sem: "1st Semester",price:"Rs : 300" )),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, tag, context,name,sem,price}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {

        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            ),
            boxShadow: [
              BoxShadow(
                color: (Colors.grey[400])!,
                blurRadius: 10,
                offset: Offset(0, 10)
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
                        FadeAnimation(1, Text(name, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                        SizedBox(height: 10,),
                        FadeAnimation(1.1, Text(sem, style: TextStyle(color: Colors.white, fontSize: 20),)),

                      ],
                    ),
                  ),
                  FadeAnimation(1.2, Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: Center(
                      child: Icon(Icons.favorite_border, size: 20,),
                    ),
                  ))
                ],
              ),
              FadeAnimation(1.2, Text(price, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),
    );
  }
}
