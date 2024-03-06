import 'package:flutter/material.dart';
import 'package:invoice_automatic/utils/colors.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  final List<String> selectLanguages = <String>[
    'English',
    'Spanish',
    'Chinese',
    'Portuguese',
    'Turkish'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Language',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
        ),
        toolbarHeight: 80,
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: selectLanguages.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: white, //background color of button
                    side: BorderSide(
                        width: 2, color: mainColor), //border width and color
                    // elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(7)),
                    padding: EdgeInsets.all(10)),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    selectLanguages[index],
                    style: TextStyle(
                      color: lightText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
