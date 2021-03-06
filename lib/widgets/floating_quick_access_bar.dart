import 'package:share_circle/screens/profile.dart';
import 'package:share_circle/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/books/books.dart';
import '../screens/sell_book.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  late SharedPreferences prefs;
  List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];

  List<String> items = ['Books', 'Sell','Profile',];
  List<IconData> icons = [
    Icons.book,
    Icons.book_online,
    Icons.people,
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () async {
          print("${items[i]}");
          if (items[i] == "Books") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BooksPage()));
          }
          else if (items[i] == "Sell") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SellPage()));
          }
          else if (items[i] == "Profile") {
            prefs = await SharedPreferences.getInstance();
            var name = prefs.getString("email");
            print(name);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage(name!)));

          }

        },
        child: Text(
          items[i],
          style: TextStyle(
            color: _isHovering[i]
                ? Theme.of(context).primaryTextTheme.button!.decorationColor
                : Theme.of(context).primaryTextTheme.button!.color,
          ),
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(items.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: Card(
                        color: Theme.of(context).cardColor,
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: widget.screenSize.height / 45,
                              bottom: widget.screenSize.height / 45,
                              left: widget.screenSize.width / 20),
                          child: Row(
                            children: [
                              Icon(
                                icons[pageIndex],
                                color: Theme.of(context).iconTheme.color,
                              ),
                              SizedBox(width: widget.screenSize.width / 20),
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () async {
                                  print(items[pageIndex]);
                                  if(items[pageIndex]=="Sell"){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => SellPage()));
                                  }
                                  else if(items[pageIndex]=="Books"){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => BooksPage()));
                                  }
                                  else if(items[pageIndex]=="Profile"){
                                    prefs = await SharedPreferences.getInstance();
                                    var name = prefs.getString("email");
                                    print(name);

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ProfilePage(name!)));
                                  }
                                  else{}
                                },
                                child: Text(
                                  items[pageIndex],
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .button!
                                          .color,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.screenSize.height / 50,
                    bottom: widget.screenSize.height / 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateRowElements(),
                  ),
                ),
              ),
      ),
    );
  }
}
