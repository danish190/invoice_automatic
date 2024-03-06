import 'package:flutter/material.dart';
import 'package:invoice_automatic/utils/colors.dart';

import 'invoices_form_screen.dart';

class InvoiceScreen extends StatefulWidget {
  final String title;
  const InvoiceScreen({super.key, required this.title});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
        ),
        backgroundColor: mainColor,
        toolbarHeight: 80,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: white,
              size: 30,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset(
                'assets/invoicePage.png',
                height: 150,
              ),
              Text(
                'Send invoices, get paid',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19.08,
                    color: blackText),
              ),
              SizedBox(
                width: 240,
                child: Text(
                  'This is where invoices live. check here to see whther they’ve been opened or paid.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 11.47,
                      fontWeight: FontWeight.w400,
                      color: blackText),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: white, //background color of button
                      side: BorderSide(
                          width: 2, color: mainColor), //border width and color
                      // elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(10),
                      backgroundColor: mainColor),
                  onPressed: () {
                    setState(
                      () {
                        Navigator.of(context, rootNavigator: false)
                            .push(MaterialPageRoute(
                                builder: (context) => InvoicesForm(
                                      title: 'Invoices ',
                                    ),
                                maintainState: false));
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Center(
                      child: Text(
                        'Create an invoice ',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 20,
                      blurRadius: 25,
                      offset: Offset(0, 100), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}