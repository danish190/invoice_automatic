import 'package:flutter/material.dart';
import 'package:invoice_automatic/utils/colors.dart';

class PrivacyPolicy extends StatefulWidget {
  final String title;
  const PrivacyPolicy({super.key, required this.title});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26)),
        backgroundColor: mainColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Privacy policy',
                    style: TextStyle(
                      fontSize: 21.36,
                      fontWeight: FontWeight.w600,
                      color: lightText,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words believable. It is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: lightText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
