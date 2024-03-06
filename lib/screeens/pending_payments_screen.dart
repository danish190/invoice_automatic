import 'package:flutter/material.dart';
import 'package:invoice_automatic/screeens/pending_payemnt_values_screen.dart';
import 'package:invoice_automatic/utils/colors.dart';

class PendingPayment extends StatefulWidget {
  final String title;
  const PendingPayment({super.key, required this.title});

  @override
  State<PendingPayment> createState() => _PendingPaymentState();
}

class _PendingPaymentState extends State<PendingPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26), 
),
        backgroundColor: mainColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/pending_payment.png',
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            ),
            GestureDetector(
              onTap: (){
                 setState(
                          () {
                            Navigator.of(context, rootNavigator: false)
                                .push(MaterialPageRoute(
                                    builder: (context) => PendingPaymentValues(
                                          title: 'Pending payment',
                                        ),
                                    maintainState: false));
                          },
                        );
              },
              child: Text(
                'Your pending payments',
                style: TextStyle(
                    fontSize: 23, color: black, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
                width: 200,
                child: Text(
                  'Your pending payments will appear here',
                  style: TextStyle(
                    fontSize: 14.16,
                    color: black,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
