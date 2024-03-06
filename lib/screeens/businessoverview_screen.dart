import 'package:flutter/material.dart';
import 'package:invoice_automatic/screeens/tab_estimates_screen.dart';
import 'package:invoice_automatic/screeens/tab_invoice_screen.dart';
import 'package:invoice_automatic/screeens/tab_revenue_scree.dart';
import 'package:invoice_automatic/utils/colors.dart';

class BusinessOverview extends StatefulWidget {
  final String title;
  const BusinessOverview({super.key, required this.title});

  @override
  State<BusinessOverview> createState() => _BusinessOverviewState();
}

class _BusinessOverviewState extends State<BusinessOverview> {
  bool color = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
          ),
          backgroundColor: mainColor,
          elevation: 0,
          toolbarHeight: 80,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: mainColor, //color of border
                      width: 1, //width of border
                    ),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TabBar(
                          padding: EdgeInsets.all(7.0),
                          unselectedLabelColor: mainColor,
                          labelColor: color == true ? mainColor : white,

                          //  splashBorderRadius: BorderRadius.circular(12),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                            color: color == true ? white : mainColor,
                          ),

                          tabs: [
                            Tab(
                              text: 'invoices',
                            ),
                            Tab(
                              text: 'Estimates',
                            ),
                            Tab(
                              text: 'Revenue',
                            ),
                          ],
                        ),
                      ),

                      // Text('data'),
                      // Text('data'),
                      // Text('data'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                height: 700,
                child: TabBarView(children: [
                  Container(
                    child: TabInvoicePage(),
                  ),
                  Container(
                    child: TabEstimatesPage(),
                  ),
                  Container(
                    child: TabRevenuePage(),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
