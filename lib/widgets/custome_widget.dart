import 'package:flutter/material.dart';
import '../utils/colors.dart';

class PendingPaymentItem extends StatefulWidget {
  String invoiceNumber ;
  String name;
  String date;
  String  price;
  String status;
   PendingPaymentItem({super.key, required this.invoiceNumber,required this.name,required this.date, required this.price, required this.status});

  @override
  State<PendingPaymentItem> createState() => _PendingPaymentItemState();
}

class _PendingPaymentItemState extends State<PendingPaymentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: lightText, //color of border
                  width: 1, //width of border
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    widget.invoiceNumber,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: lightText),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: lightText),
                        ),
                        Spacer(),
                        Container(
                           padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
                          child: Text(
                            widget.status,
                            style: TextStyle(
                                fontSize: 7.3,
                                fontWeight: FontWeight.w500,
                                color: white,),
                        
                          ),
                        ),
                      ],
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                         widget.price,
                          style: TextStyle(
                              fontSize: 11.58,
                              fontWeight: FontWeight.w500,
                              color: lightText),
                        )),
                    Text(
                      'Date',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: lightText),
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: lightText),
                    ),
                    
                  ],
                ),
              ),
            );
  }
}