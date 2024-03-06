import 'package:flutter/material.dart';

import '../utils/colors.dart';

class EstimateDetail extends StatefulWidget {
  final String title;
  const EstimateDetail({super.key, required this.title});

  @override
  State<EstimateDetail> createState() => _EstimateDetailState();
}

class _EstimateDetailState extends State<EstimateDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
        ),
        backgroundColor: mainColor,
        elevation: 0,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Delete',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Estimate',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: lightText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Mirachel',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: lightText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'legomirachel@gmail.com',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: lightText),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: mainColor, //color of border
                    width: 1, //width of border
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Items',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: lightText),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'chair',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: lightText),
                          ),
                          // SizedBox(width: 60),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            '02',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: lightText),
                          ),
                        ],
                      ),
                      Text(
                        '£3.00',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: lightText),
                      ),
                      Divider(
                        color: lightText,
                        height: 15,
                        thickness: 1,
                        indent: 1,
                        endIndent: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'table',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: lightText),
                          ),
                          // SizedBox(width: 60),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            '01',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: lightText),
                          ),
                        ],
                      ),
                      Text(
                        '£5.00',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: lightText),
                      ),
                      Divider(
                        color: lightText,
                        height: 20,
                        thickness: 1,
                        indent: 1,
                        endIndent: 1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: mainColor, //color of border
                        width: 1, //width of border
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Subtotal',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: lightText),
                          ),
                          Divider(
                            color: lightText,
                            height: 5,
                            thickness: 1,
                            indent: 1,
                            endIndent: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Dictionary',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: lightText),
                          ),
                          Divider(
                            color: lightText,
                            height: 5,
                            thickness: 1,
                            indent: 1,
                            endIndent: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: lightText),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: mainColor, //color of border
                        width: 1, //width of border
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '£8.00',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: lightText),
                          ),
                          Divider(
                            color: lightText,
                            height: 5,
                            thickness: 1,
                            indent: 6,
                            endIndent: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '£2.00',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: lightText),
                          ),
                          Divider(
                            color: lightText,
                            height: 5,
                            thickness: 1,
                            indent: 6,
                            endIndent: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '£6.00',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: lightText),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: 500,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 120,
                      // height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: white, //background color of button
                            side: BorderSide(
                                width: 2,
                                color: mainColor), //border width and color
                            // elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(10),
                            backgroundColor: mainColor),
                        onPressed: () {
                          setState(
                            () {
                              Navigator.of(context, rootNavigator: false)
                                  .push(MaterialPageRoute(
                                      builder: (context) => EstimateDetail(
                                            title: 'Estimate Detail ',
                                          ),
                                      maintainState: false));
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      // height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: white, //background color of button
                            side: BorderSide(
                                width: 2,
                                color: mainColor), //border width and color
                            // elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(10),
                            backgroundColor: mainColor),
                        onPressed: () {
                          setState(
                            () {
                              Navigator.of(context, rootNavigator: false)
                                  .push(MaterialPageRoute(
                                      builder: (context) => EstimateDetail(
                                            title: 'Estimate Detail ',
                                          ),
                                      maintainState: false));
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            'Print',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
    );
  }
}
