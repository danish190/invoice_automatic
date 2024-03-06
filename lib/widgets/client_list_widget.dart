import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ClientListWidget extends StatefulWidget {
  String textName;
  String textEmail;
  String textWebsite;
  Image image;

  ClientListWidget({
    super.key,
    required this.textName,
    required this.textEmail,
    required this.textWebsite,
    required this.image,
  });

  @override
  State<ClientListWidget> createState() => _ClientListWidgetState();
}

class _ClientListWidgetState extends State<ClientListWidget> {
  SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: lightText, //color of border
            width: 1.0, //width of border
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/client_logo.png'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mirachel',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: mainColor),
                  ),
                  Text(
                    'legomirachel@gmail.com',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: mainColor),
                  ),
                  Text(
                    'www.lego.com',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: mainColor),
                  ),
                ],
              ),
              PopupMenuButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                padding: EdgeInsets.all(0),
                position: PopupMenuPosition.over,
                splashRadius: 10,
                constraints: BoxConstraints(maxWidth: 50, maxHeight: 25),

                // initialValue: selectedMenu,
                offset: Offset(-25, -7),
                elevation: 0,
                color: mainColor,
                onSelected: (SampleItem item) {
                  setState(() {
                    selectedMenu = item;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<SampleItem>>[
                  PopupMenuItem(
                    height: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    value: SampleItem.itemOne,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => _dialogBuilder(context),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              fontSize: 8.0,
                              color: white,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum SampleItem {
  itemOne,
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AlertDialog(
            //  titlePadding:EdgeInsets.symmetric(vertical: 2,),
            // contentPadding: EdgeInsets.symmetric(vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            alignment: Alignment.center,
            title: Text(
              'Confirmation',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: black,
              ),
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Do you want to delete this cilent',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: black),
              textAlign: TextAlign.center,
            ),

            actions: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 42),
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        // side: BorderSide(),
                      ),
                      backgroundColor: mainColor,
                    ),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 42),
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        // side: BorderSide(),
                      ),
                      backgroundColor: mainColor,
                    ),
                    child: const Text(
                      'No',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    },
  );
}
