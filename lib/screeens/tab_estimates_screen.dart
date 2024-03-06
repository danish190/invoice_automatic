import 'package:flutter/material.dart';
import '../utils/colors.dart';

class TabEstimatesPage extends StatefulWidget {
  const TabEstimatesPage({super.key});

  @override
  State<TabEstimatesPage> createState() => _TabEstimatesPageState();
}

class _TabEstimatesPageState extends State<TabEstimatesPage> {
  bool date = false;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext parentContext) async {
    final DateTime? picked = await showDatePicker(
        context: parentContext,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date = true;
        print(selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: mainColor,
                      )),
                  width: 120,
                  height: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '£0',
                        style: TextStyle(
                            fontSize: 23,
                            color: mainColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Estimate this year',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: mainColor,
                      )),
                  width: 120,
                  height: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '£0',
                        style: TextStyle(
                            fontSize: 23,
                            color: mainColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Estimate this month',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: mainColor,
                      )),
                  width: 120,
                  height: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '£0',
                        style: TextStyle(
                            fontSize: 23,
                            color: mainColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'All time Estimates',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //       SizedBox(
                //   height: 10,
                // ),
                Text(
                  'Estimate Summary',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: mainColor),
                ),
                // Spacer(),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      showModalBottomSheet<void>(
                          constraints: BoxConstraints(maxWidth: 350),
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          builder: (dialogContext) {
                            return StatefulBuilder(
                                builder: (stfContext, stfSetState) {
                              return SizedBox(
                                height: 100,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            showModalBottomSheet<void>(
                                                context: context,
                                                constraints: BoxConstraints(
                                                    maxWidth: 350),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                builder: (dialogContext) {
                                                  return StatefulBuilder(
                                                      builder: (stfContext,
                                                          stfSetState) {
                                                    return SizedBox(
                                                      height: 200,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              'Custom Dates',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    mainColor,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary:
                                                                      white,
                                                                  side: BorderSide(
                                                                      width: 1,
                                                                      color:
                                                                          mainColor),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    //to set border radius to button
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                ),
                                                                onPressed: () =>
                                                                    _selectDate(
                                                                        context),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              18),
                                                                  child: date ==
                                                                          true
                                                                      ? Text(
                                                                          "${selectedDate.toLocal()}"
                                                                              .split(' ')[0],
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                lightText,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        )
                                                                      : Text(
                                                                          'start date'),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20.0,
                                                                width: 40,
                                                              ),
                                                              ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary:
                                                                      white,
                                                                  side: BorderSide(
                                                                      width: 1,
                                                                      color:
                                                                          mainColor),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0)),
                                                                ),
                                                                onPressed: () =>
                                                                    _selectDate(
                                                                        context),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              18),
                                                                  child: Text(
                                                                    'End Date',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          lightText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: SizedBox(
                                                              width: 200,
                                                              child:
                                                                  ElevatedButton(
                                                                style: ElevatedButton.styleFrom(
                                                                    primary:
                                                                        white,
                                                                    side: BorderSide(
                                                                        width:
                                                                            2,
                                                                        color:
                                                                            mainColor),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8)),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    backgroundColor:
                                                                        mainColor),
                                                                onPressed: () {
                                                                  setState(
                                                                    () {},
                                                                  );
                                                                },
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Search ',
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            white,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        fontSize:
                                                                            11.24,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                                });
                                          });
                                        },
                                        child: Text(
                                          'Custom',
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.w700,
                                              color: mainColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                          });
                    });
                  },
                  child: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: mainColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
