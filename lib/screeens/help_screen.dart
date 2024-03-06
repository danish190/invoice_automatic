import 'package:flutter/material.dart';
import 'package:invoice_automatic/screeens/help_center_screen.dart';
import 'package:invoice_automatic/screeens/privacy_policy_screen.dart';
import 'package:invoice_automatic/screeens/terms_and_condition_screen.dart';
import 'package:invoice_automatic/utils/colors.dart';

import 'contact_us_screen.dart';

class HelpPage extends StatefulWidget {
  final String title;
  const HelpPage({super.key, required this.title});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpCenterPage(
                            title: 'Help center ',
                          ),
                        ),
                      );
                    },
                  );
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: mainColor,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/inquiry_help.png'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Help center',
                        style: TextStyle(
                            fontSize: 15.04,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: mainColor,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/team_inquiry.png'),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ContactUs(title: 'Contanct us '),
                              ),
                            );
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contanct us',
                            style: TextStyle(
                                fontSize: 15.04,
                                fontWeight: FontWeight.w500,
                                color: lightText),
                          ),
                          Text(
                            'Questions ? Need help ?',
                            style: TextStyle(
                                fontSize: 15.04,
                                fontWeight: FontWeight.w100,
                                color: lightText),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: mainColor,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PrivacyPolicy(title: 'Privacy policy '),
                        ),
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/privacy_help.png'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Privacy policy',
                        style: TextStyle(
                            fontSize: 15.04,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: mainColor,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TermsAndCondition(title: 'Terms and condition '),
                        ),
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/terms_and_condition.png'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Terms and condition',
                        style: TextStyle(
                            fontSize: 15.04,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
