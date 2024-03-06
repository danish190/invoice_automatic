import 'package:flutter/material.dart';
import 'package:invoice_automatic/utils/colors.dart';

import '../widgets/custome_widget.dart';

class PendingPaymentValues extends StatefulWidget {
  final String title;
  const PendingPaymentValues({super.key, required this.title});

  @override
  State<PendingPaymentValues> createState() => _PendingPaymentValuesState();
}

class _PendingPaymentValuesState extends State<PendingPaymentValues> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26), 
 ),
        backgroundColor: mainColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder:(BuildContext context, int index){
                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: PendingPaymentItem(date: '25 june 01:20pm' , invoiceNumber: 'invoices # 001', name: 'Quintessa Swindell', price: '£ 100.00', status: 'Pending',),
                      );
                  },
                
                 ),
              ) , 
            ),
            
          ],
        ),
      ),
    );
  }
}
