
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const double unitPrice = 30.00;

class ShoppingCartView extends StatefulWidget {

  final String name;
  final String price;
  ShoppingCartView(
      this.name,this.price);

  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState(name,price);
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  final String name;
  final String price;
  int quantity = 1;
  bool orderRequestInProgress = false;

  _ShoppingCartViewState( this.name, this.price);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Book cart",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            width: 600,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 8.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("Book",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .apply(fontWeightDelta: 2)),
                              Text(name,
                                      ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("Quantity",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .apply(fontWeightDelta: 2)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  MaterialButton(
                                      child: Text("-"),
                                      onPressed: () {
                                        setState(() {
                                          quantity--;

                                          if (quantity < 1) {
                                            quantity = 1;
                                          }
                                        });
                                      }),
                                  Text("$quantity"),
                                  MaterialButton(
                                    child: Text("+"),
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text("Price",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .apply(fontWeightDelta: 2)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("₹ "+price),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 8.0,
                    ),
                    Text("Order Summary",
                        style: Theme.of(context).textTheme.headline6),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("Subtotal"), Text("${getTotal()}")],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Grand Total",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .apply(fontWeightDelta: 2),
                        ),
                        Text("${getTotal()}",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .apply(fontWeightDelta: 2))
                      ],
                    ),
                    Container(
                      height: 8.0,
                    ),
                    Center(child: getPlaceYourOrderWidget())
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget getPlaceYourOrderWidget() {
    return Container(
      width: 500,
      child: RaisedButton(
        child: orderRequestInProgress
            ? Padding(
              padding: const EdgeInsets.all(1.0),
              child: SizedBox(
                child: CircularProgressIndicator(),
                height: 20.0,
                width: 20.0,
              ),
            )
            : const Text("Place your order"),
        onPressed: () async {
          print("place order was pressed");

          if (orderRequestInProgress) {
            return;
          }


          _setProgress(true);


          String paymentMethodId;




          _setProgress(false);
          _alertUser("Success",
              "Order successful. Please check your e-mail for order confirmation", goBack: true);
        },
      ),
    );
  }

  _setProgress(bool inProgress) {
    setState(() {
      orderRequestInProgress = inProgress;
    });
  }

  String getTotal() {
    return NumberFormat.simpleCurrency().format(quantity * int.parse(price));
  }

  Future<void> _alertUser(String title, String alertText, {goBack = false}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: title.isNotEmpty ? Text(title) : null,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(alertText),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                if (goBack) {
                  Navigator.of(context).maybePop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
