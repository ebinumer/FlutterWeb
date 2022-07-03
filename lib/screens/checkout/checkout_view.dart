import 'package:flutter/material.dart';
import 'package:share_circle/screens/checkout/shopping_cart_view.dart';

const String firstName = "First name";
const String lastName = "Last name";
const addressLine1 = "Address Line 1";
const city = "City";
const zipCode = "Zip Code";
const creditCardNumber = "Card Number";
const expirationDate = "MMYY";
const securityCode = "Security Code";

class CheckoutView extends StatefulWidget {

  String name;
  String price;

  CheckoutView( this.name, this.price);

  @override
  _CheckoutViewState createState() => _CheckoutViewState(name,price);
}

class _CheckoutViewState extends State<CheckoutView> {
  final _formKey = GlobalKey<FormState>();
  final String name;
  final String price;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var companyController = TextEditingController();
  var addressLine1Controller = TextEditingController();
  var addressLine2Controller = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var zipController = TextEditingController();


  _CheckoutViewState( this.name,this.price);

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView (
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView (
              scrollDirection: Axis.vertical,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Container(
                      width: 600,
                      child: Column(
                        children: <Widget>[
                          getNameWidget(),
                          Container(
                            height: 16.0,
                          ),
                          getAddressWidget(),
                          Container(
                            height: 16.0,
                          ),
                          getCreditCardWidget(),
                        ],
                      ),
                    ),
                  ),
                  ShoppingCartView(name,price)
                ],
              ),
            ),
          ),
        ));
  }

  Column getNameWidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text("Full Name", style: Theme.of(context).textTheme.headline6),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 250,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '$firstName must not be empty.';
                        }
                        return null;
                      },
                      controller: firstNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: firstName,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    width: 250,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '$lastName must not be empty.';
                        }
                        return null;
                      },
                      controller: lastNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: lastName,
                      ),
                    ),
                  )
                ]),
          ),
          SizedBox(
            width: 500,
            child: TextField(
              controller: companyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Company (Optional)",
              ),
            ),
          )
        ]);
  }

  Column getAddressWidget() {

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Shipping Address",
                style: Theme.of(context).textTheme.headline6),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: 500,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '$addressLine1 not be empty.';
                  }
                  return null;
                },
                controller: addressLine1Controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: addressLine1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              width: 500,
              child: TextField(
                controller: addressLine2Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Address line 2",
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 300,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '$city must not be empty.';
                    }
                    return null;
                  },
                  controller: cityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: city,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: stateController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "State",
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '$zipCode must not be empty.';
                    }
                    return null;
                  },
                  controller: zipController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: zipCode,
                  ),
                ),
              ),
            ],
          )
        ]);
  }

  Column getCreditCardWidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Card Information",
                style: Theme.of(context).textTheme.headline6),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 250,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '$creditCardNumber must not be empty.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: creditCardNumber,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '$expirationDate must not be empty.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: expirationDate,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                width: 150,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '$securityCode must not be empty.';
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: securityCode,
                  ),
                ),
              ),
            ],
          )
        ]);
  }



}

