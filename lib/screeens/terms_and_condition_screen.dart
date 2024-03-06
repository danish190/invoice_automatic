import 'package:flutter/material.dart';
import 'package:invoice_automatic/utils/colors.dart';

class TermsAndCondition extends StatefulWidget {
  final String title;
  const TermsAndCondition({super.key, required this.title});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
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
                    'Terms and condition',
                    style: TextStyle(
                      fontSize: 21.36,
                      fontWeight: FontWeight.w600,
                      color: lightText,
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              Text(
                'Invoice-generator.com (a service of Invoiced) does not store any of your information on its servers. The functionality on invoice-generator.com is provided "as is" with no expressed or implied warranties. By using invoice-generator.com you agree to not hold its owner liable for any consequential or incidental damages. \n We place no restrictions on how you use invoices generated from our service. The service itself including the use of the Invoiced name, invoice template, domain names and other distinctive brand features are protected by copyright and other laws: © Invoiced. All rights reserved. You may not duplicate, copy, or reuse any portion of the code (HTML/CSS/Javascript) or use visual design elements.',
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
