import 'package:flutter/material.dart';
import 'package:invoice_automatic/utils/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
      
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                constraints: BoxConstraints(
                                  maxWidth: 350,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                ),
                                useSafeArea: true,
                                builder: (context) => Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: mainColor,
                                          ),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Old Password',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.33,
                                                  color: mainColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 43.0,
                                                child: TextField(
                                                  scrollPadding:
                                                      EdgeInsets.only(
                                                          bottom: 200),
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(6),
                                                    hintText: 'Old Password',
                                                    hintStyle: TextStyle(
                                                      color: greyLightText,
                                                      fontSize: 8.18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: mainColor,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
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
                                              Text(
                                                'New Password',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.33,
                                                  color: mainColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 43.0,
                                                child: TextField(
                                                  scrollPadding:
                                                      const EdgeInsets.only(
                                                          bottom: 200),
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(6),
                                                    hintText: 'New Password',
                                                    hintStyle: TextStyle(
                                                      fontSize: 8.18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: greyLightText,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: mainColor,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
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
                                              Text(
                                                'Confirm New Password',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.33,
                                                  color: mainColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 43.0,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: TextField(
                                                  scrollPadding:
                                                      const EdgeInsets.only(
                                                          bottom: 200),
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(6),
                                                    hintText:
                                                        'Confirm New Password',
                                                    hintStyle: TextStyle(
                                                      fontSize: 8.18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: greyLightText,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: mainColor,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
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
                                              Align(
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  width: 200,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: white,
                                                      side: BorderSide(
                                                          width: 2,
                                                          color: mainColor),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      backgroundColor:
                                                          mainColor,
                                                    ),
                                                    onPressed: () {
                                                      setState(
                                                        () {},
                                                      );
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(3),
                                                      child: Center(
                                                        child: Text(
                                                          'Save ',
                                                          style: TextStyle(
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 11.24,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));

//                          showModalBottomSheet(context: context,
// isScrollControlled: true,
//                                                    constraints: BoxConstraints(
//                                                     maxWidth: 350),
//                          shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           10.0),
//                                                 ),
//                                                 useSafeArea: true,

//                           builder: (BuildContext context){
//                               return  SingleChildScrollView(
//                                   reverse: true,
//                                   child: Padding(
//                                     padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 30),
//                                     child: SizedBox(
//                                       // height: 300,
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text('Old Password', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.33,color: mainColor,),),
//                                            SizedBox(
//                                                   height: 43.0,
//                                                   child: TextField(
//                                                      scrollPadding:  EdgeInsets.only(bottom: 200),
//                                                     decoration: InputDecoration(
//                                                       contentPadding: EdgeInsets.all(6),
//                                                       hintText: 'Old Password',
//                                                       hintStyle: TextStyle(
//                                                          color: greyLightText,
//                                                         fontSize: 8.18,
//                                                         fontWeight: FontWeight.w500,
//                                                       ),
//                                                       focusedBorder: OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: mainColor,
//                                                           width: 2.0,
//                                                         ),
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                       ),
//                                                       border: OutlineInputBorder(
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                         borderSide: BorderSide(
//                                                             // color: Colors.grey, width: 0.0
//                                                             ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                             height: 10,
//                                           ),
//                                           Text('New Password'),
//                                            SizedBox(
//                                                   height: 43.0,
//                                                   child: TextField(
//                                                      scrollPadding: const EdgeInsets.only(bottom: 200),
//                                                     decoration: InputDecoration(
//                                                       contentPadding: EdgeInsets.all(6),
//                                                       hintText: 'New Password',
//                                                       hintStyle: TextStyle(
//                                                         fontSize: 8.18,
//                                                         fontWeight: FontWeight.w500,
//                                                         color: greyLightText,
//                                                       ),
//                                                       focusedBorder: OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: mainColor,
//                                                           width: 2.0,
//                                                         ),
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                       ),
//                                                       border: OutlineInputBorder(
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                         borderSide: BorderSide(
//                                                             // color: Colors.grey, width: 0.0
//                                                             ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                  SizedBox(
//                                             height: 10,
//                                           ),
//                                           Text('Confirm New Password'),
//                                            SizedBox(
//                                                   height: 43.0,
//                                                   width: MediaQuery.of(context).size.width,
//                                                   child: TextField(
//                                                      scrollPadding: const EdgeInsets.only(bottom: 200),
//                                                     decoration: InputDecoration(
//                                                       contentPadding: EdgeInsets.all(6),
//                                                       hintText: 'Confirm New Password',
//                                                       hintStyle: TextStyle(
//                                                        fontSize: 8.18,
//                                                         fontWeight: FontWeight.w500,
//                                                         color: greyLightText,
//                                                       ),
//                                                       focusedBorder: OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: mainColor,
//                                                           width: 2.0,
//                                                         ),
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                       ),
//                                                       border: OutlineInputBorder(
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                         borderSide: BorderSide(
//                                                             // color: Colors.grey, width: 0.0
//                                                             ),
//                                                       ),
//                                                     ),

//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                   Align(
//                                                                 alignment: Alignment
//                                                                     .center,
//                                                                 child: SizedBox(
//                                                                   width: 200,
//                                                                   child:
//                                                                       ElevatedButton(
//                                                                     style: ElevatedButton.styleFrom(
//                                                                         primary:
//                                                                             white,
//                                                                         side: BorderSide(
//                                                                             width:
//                                                                                 2,
//                                                                             color:
//                                                                                 mainColor),
//                                                                         shape: RoundedRectangleBorder(
//                                                                             borderRadius:
//                                                                                 BorderRadius.circular(
//                                                                                     8)),
//                                                                         padding:
//                                                                             EdgeInsets.all(
//                                                                                 10),
//                                                                         backgroundColor:
//                                                                             mainColor),
//                                                                     onPressed: () {
//                                                                       setState(
//                                                                         () {},
//                                                                       );
//                                                                     },
//                                                                     child: Padding(
//                                                                       padding:
//                                                                           EdgeInsets
//                                                                               .all(
//                                                                                   3),
//                                                                       child: Center(
//                                                                         child: Text(
//                                                                           'Save ',
//                                                                           style:
//                                                                               TextStyle(
//                                                                             color:
//                                                                                 white,
//                                                                             fontWeight:
//                                                                                 FontWeight.w700,
//                                                                             fontSize:
//                                                                                 11.24,
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );

//                           }
//                           );
                          },
                        );
                      },
                      child: Text(
                        'Change Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            color: mainColor),
                      )),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal details',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // color: Colors.blue,
                    height: 165,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'first name :',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Text(
                            'Bruce',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Text(
                            'Last name :',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Text(
                            'Wayne',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Text(
                            'Email :',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Text(
                            'BruceWayne@gmail.com',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Professions details',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: mainColor),
                        ),
                        Container(
                         
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: mainColor,
                              border: Border.all(
                                color: mainColor,
                              ),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Edit',
                              style: TextStyle(fontSize: 12.0, color: white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    height: 215,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Business Name :',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Text(
                            'Bruce',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Text(
                            'Business address :',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Text(
                            'Gotham City , New Jersey ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Text(
                            'Business Phone :',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Text(
                            '+ 44 1223 456',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Text(
                            'Business URL :',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                          Text(
                            'www.batman.com',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                        ],
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
