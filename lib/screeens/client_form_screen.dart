import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ClientScreen extends StatefulWidget {
  final String title;
  const ClientScreen({super.key, required this.title});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26),),
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
             
            },
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/r.png'),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/default_user.png'),
                        backgroundColor: white,
                        radius: 25,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 5,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.add,
                          color: white,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Billing name',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: lightText,
                  ),
                ),
              ),
              SizedBox(
                height: 43.0,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'jane smith',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: greyLightText,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          // color: Colors.grey, width: 0.0
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Mobile',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: lightText,
                  ),
                ),
              ),
              SizedBox(
                height: 43.0,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: '+44 12345685',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: greyLightText,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          // color: Colors.grey, width: 0.0

                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: lightText,
                  ),
                ),
              ),
              SizedBox(
                height: 43.0,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'Jane@smith.com',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: greyLightText,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          // color: Colors.grey, width: 0.0

                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Billing address',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: lightText,
                  ),
                ),
              ),
              SizedBox(
                height: 43.0,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'Billing address',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: greyLightText,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          // color: Colors.grey, width: 0.0

                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Phone',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: lightText,
                  ),
                ),
              ),
              SizedBox(
                height: 43.0,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'Number',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: greyLightText,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          // color: Colors.grey, width: 0.0

                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Website',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: lightText,
                  ),
                ),
              ),
              SizedBox(
                height: 43.0,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'e.g. www.smith.com',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: greyLightText,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          // color: Colors.grey, width: 0.0

                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Tax number',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: lightText,
                  ),
                ),
              ),
              SizedBox(
                height: 43.0,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'Client’s tax number',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: greyLightText,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          // color: Colors.grey, width: 0.0

                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Add notes',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: lightText,
                  ),
                ),
              ),
              TextField(
                // controller: textarea,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                maxLength: 5000,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  hintText: 'Add notes about the client . they can’t see these',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: lightText,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: mainColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: mainColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
