import 'package:flutter/material.dart';
import 'package:invoice_automatic/utils/colors.dart';
import 'client_edit_screen.dart';


class ClientInfoPage extends StatefulWidget {
  final String title;
  const ClientInfoPage({super.key, required this.title});

  @override
  State<ClientInfoPage> createState() => _ClientInfoPageState();
}

class _ClientInfoPageState extends State<ClientInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,  style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26),),
         toolbarHeight: 80,
        backgroundColor: mainColor,
        elevation: 0,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(
          //     Icons.add,
          //     color: white,
          //   ),
          //   onPressed: () {
          //     // setState(
          //     //         () {
          //     //           Navigator.of(context, rootNavigator: false)
          //     //               .push(MaterialPageRoute(
          //     //                   builder: (context) => ClientScreen(
          //     //                         title: 'Add cilent ',
          //     //                       ),
          //     //                   maintainState: false));
          //     //         },
          //     //       );
          //   },
          // )
          GestureDetector(
            onTap: () {
               setState(
                () {
                  Navigator.of(context, rootNavigator: false)
                      .push(MaterialPageRoute(
                          builder: (context) => ClientEditScreen(
                                title: 'Edit Client Info ',
                              ),
                          maintainState: false));
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                'Edit',
                style: TextStyle(
                    fontSize: 12.36, fontWeight: FontWeight.w400, color: white),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                color: mainColor,
                image: DecorationImage(
                  image: AssetImage('assets/logo2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        // backgroundImage: AssetImage('assets/r.png'),
                        backgroundColor: white,
                        radius: 10,

                        child: SizedBox(
                          height: 170,
                          width: 140,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/profile_screen.jpeg'),
                            backgroundColor: mainColor,
                            radius: 20,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Bruce Wayne',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 32.92,
                          color: white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16.46,
                        fontWeight: FontWeight.w500,
                        color: lightText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.38,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: 'Mirachel@gmail.com',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: greyLightText,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide: BorderSide(
                              // color: Colors.grey, width: 0.0

                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Website address',
                      style: TextStyle(
                        fontSize: 16.46,
                        fontWeight: FontWeight.w500,
                        color: lightText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.38,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: 'www.mirachel.com',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: greyLightText,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide: BorderSide(
                              // color: Colors.grey, width: 0.0

                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'mobile number',
                      style: TextStyle(
                        fontSize: 16.46,
                        fontWeight: FontWeight.w500,
                        color: lightText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.38,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: '+ 44 123 456',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: greyLightText,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide: BorderSide(
                              // color: Colors.grey, width: 0.0

                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Tax number',
                      style: TextStyle(
                        fontSize: 16.46,
                        fontWeight: FontWeight.w500,
                        color: lightText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.38,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
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
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
