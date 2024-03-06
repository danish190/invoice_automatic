import 'package:flutter/material.dart';
import 'package:invoice_automatic/utils/colors.dart';

class Report extends StatefulWidget {
  final String title;
  const Report({super.key, required this.title});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'if you find any bugs please let us know',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: lightText,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller: textarea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 18,
                  maxLength: 500,

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    hintText: 'Report a bugs',
                    hintStyle: TextStyle(
                        fontSize: 15,
                        color: lightText,
                        fontWeight: FontWeight.w500),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: lightText),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(
                    //     20.0,
                    //   ),
                    //   borderSide: BorderSide(),
                    // ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: white, //background color of button
                          side: BorderSide(
                              width: 2,
                              color: mainColor), //border width and color
                          // elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.all(10),
                          backgroundColor: mainColor),
                      onPressed: () {
                        setState(
                          () {
                            print('Report');
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Center(
                          child: Text(
                            'send',
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
