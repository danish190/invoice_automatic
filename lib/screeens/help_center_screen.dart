import 'package:flutter/material.dart';
import 'package:invoice_automatic/utils/colors.dart';

class HelpCenterPage extends StatefulWidget {
  final String title;
  const HelpCenterPage({super.key, required this.title});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  bool _isShow = true;
  bool _isShowOne = true;
  bool _isShowTwo = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
        ),
        toolbarHeight: 80,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We're here to help you with anything and everything on Kussbus",
                  style: TextStyle(
                      fontSize: 21.36,
                      fontWeight: FontWeight.w600,
                      color: lightText),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "At Kussbus everything we expect at a day's start is you, better and happier than yesterday. We have got you covered. Share your concern or check our frequently asked questions listed below.",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: lightText),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'FAQ',
                  style: TextStyle(
                      fontSize: 21.36,
                      fontWeight: FontWeight.w600,
                      color: lightText),
                ),
                Divider(
                  color: mainColor,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What is Invoice automatic?',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: lightText),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isShow = !_isShow;
                        });
                      },
                      child: _isShow == true
                          ? Icon(
                              Icons.arrow_drop_up,
                            )
                          : Icon(
                              Icons.arrow_drop_down,
                            ),
                    ),
                  ],
                ),
                Visibility(
                  visible: _isShow,
                  child: Text(
                    'Invoice app is a cloud - based accounting software that offers a user - friendly interface  to businesses and freelancers to manage their finances.',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: lightText),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: mainColor,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Why choose Invoice automatic ?',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: lightText),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isShowOne = !_isShowOne;
                        });
                      },
                      child: _isShowOne == true
                          ? Icon(
                              Icons.arrow_drop_up,
                            )
                          : Icon(
                              Icons.arrow_drop_down,
                            ),
                    ),
                  ],
                ),
                Visibility(
                  visible: _isShowOne,
                  child: Text(
                    'Invoice app is a cloud - based accounting software that offers a user - friendly interface  to businesses and freelancers to manage their finances.',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: lightText),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: mainColor,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What Invoice automatic lines are available?',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: lightText),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isShowTwo = !_isShowTwo;
                        });
                      },
                      child: _isShowTwo == true
                          ? Icon(
                              Icons.arrow_drop_up,
                            )
                          : Icon(
                              Icons.arrow_drop_down,
                            ),
                    ),
                  ],
                ),
                Visibility(
                  visible: _isShowTwo,
                  child: Text(
                    'Invoice app is a cloud - based accounting software that offers a user - friendly interface  to businesses and freelancers to manage their finances.',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: lightText),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  'Still stuck? Help is a mail away',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 21.36,
                      fontWeight: FontWeight.w500,
                      color: lightText),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: white, //background color of button
                          side: BorderSide(
                              width: 2,
                              color: mainColor), //border width and color
                          // elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(10),
                          backgroundColor: mainColor),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Center(
                          child: Text(
                            'Contanct us',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
