
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:invoice_automatic/screeens/help_screen.dart';
import 'package:invoice_automatic/screeens/pending_payments_screen.dart';
import 'package:invoice_automatic/screeens/profile_screen.dart';
import 'package:invoice_automatic/screeens/report_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../utils/colors.dart';
import '../widgets/big_test.dart';
import 'businessoverview_screen.dart';
import 'language_screen.dart';

enum Options { search, upload, copy, exit }

class HomeScreen extends StatefulWidget {
  final PageController pageController;

  const HomeScreen({super.key, required this.pageController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;
  List<bool> checkboxStatus = [];

  var _popupMenuItemIndex = 0;
  bool colorChangeOne = false;
  bool colorChangeTwo = false;
  bool colorChangeThree = false;
  bool colorChangeFour = false;
  bool colorChangeFive = false;
  bool colorChangeSix = false;
  bool colorChangeSeven = false;
  bool colorChangeEight = false;

  final checkList = [
    "Set up your account",
    "Let's create your first invoice.",
    "Let's create your first invoice.",
    "Let's create your first estimation.",
    "Download your first invoice.",
    "See our plan and pricing",
  ];

  @override
  void initState() {
    super.initState();
    checkList.forEach((element) => checkboxStatus.add(false));
  }

  PopupMenuItem _buildPopupMenuItem(
    String title,
    Image image,
    int position,
  ) {
    return PopupMenuItem(
      value: position,
      height: 34,
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              color: white,
              image: image.image,
              width: 20,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 8, color: white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  _onMenuItemSelected(int value) {
    setState(() {
      _popupMenuItemIndex = value;
    });

    if (value == Options.search.index) {
      widget.pageController.jumpToPage(1);

      // Navigator.of(context).popAndPushNamed('/screen4');
    } else if (value == Options.upload.index) {
      widget.pageController.jumpToPage(2);
    } else if (value == Options.copy.index) {
      widget.pageController.jumpToPage(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    // Important: Remove any padding from the ListView.

                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      SizedBox(
                          height: 100,
                          child: Image.asset('assets/home_screen_logo.png')),
                      Image.asset('assets/line_logo.png', fit: BoxFit.cover),
                      ListTile(
                        selectedColor:
                            colorChangeOne == true ? white : mainColor,
                        selectedTileColor:
                            colorChangeOne == true ? mainColor : white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                          side: BorderSide(
                              color: colorChangeOne == true ? white : white),
                        ),
                        selected: true,
                        leading: Image.asset(
                          'assets/business_overview.png',
                          color: colorChangeOne == true ? white : mainColor,
                        ),
                        title: Text("Business Overview"),
                        onTap: () {
                          setState(
                            () {
                              colorChangeOne = !colorChangeOne;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BusinessOverview(
                                      title: 'Business Overview '),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ListTile(
                        selectedColor:
                            colorChangeTwo == true ? white : mainColor,
                        selectedTileColor:
                            colorChangeTwo == true ? mainColor : white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                          side: BorderSide(
                              color: colorChangeTwo == true ? white : white),
                        ),
                        selected: true,
                        leading: Image.asset(
                          'assets/profile.png',
                          color: colorChangeTwo == true ? white : mainColor,
                        ),
                        title: Text("Proflie"),
                        onTap: () {
                          setState(
                            () {
                              colorChangeTwo = !colorChangeTwo;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ListTile(
                        selectedColor:
                            colorChangeThree == true ? white : mainColor,
                        selectedTileColor:
                            colorChangeThree == true ? mainColor : white,
                        selected: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                          side: BorderSide(
                              color: colorChangeThree == true ? white : white),
                        ),
                        leading: Image.asset(
                          'assets/language.png',
                          color: colorChangeThree == true ? white : mainColor,
                        ),
                        title: Text("Language"),
                        onTap: () {
                          setState(
                            () {
                              colorChangeThree = !colorChangeThree;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectLanguage(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ListTile(
                        selectedColor:
                            colorChangeFour == true ? white : mainColor,
                        selectedTileColor:
                            colorChangeFour == true ? mainColor : white,
                        selected: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                          side: BorderSide(
                              color: colorChangeFour == true ? white : white),
                        ),
                        leading: Image.asset(
                          'assets/pending_payment.png',
                          color: colorChangeFour == true ? white : mainColor,
                        ),
                        title: Text("Pending Payment"),
                        onTap: () {
                          setState(
                            () {
                              colorChangeFour = !colorChangeFour;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PendingPayment(title: 'Pending payment '),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ListTile(
                        selectedColor:
                            colorChangeFive == true ? white : mainColor,
                        selectedTileColor:
                            colorChangeFive == true ? mainColor : white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                          side: BorderSide(
                              color: colorChangeFive == true ? white : white),
                        ),
                        selected: true,
                        leading: Image.asset(
                          'assets/report.png',
                          color: colorChangeFive == true ? white : mainColor,
                        ),
                        title: Text("Report"),
                        onTap: () {
                          setState(
                            () {
                              colorChangeFive = !colorChangeFive;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Report(title: 'Report '),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ListTile(
                        selectedColor:
                            colorChangeSix == true ? white : mainColor,
                        selectedTileColor:
                            colorChangeSix == true ? mainColor : white,
                        selected: true,
                        leading: Image.asset(
                          'assets/help.png',
                          color: colorChangeSix == true ? white : mainColor,
                        ),
                        title: Text("Help"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                          side: BorderSide(
                              color: colorChangeSix == true ? white : white),
                        ),
                        onTap: () {
                          setState(
                            () {
                              colorChangeSix = !colorChangeSix;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HelpPage(title: 'Help '),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ListTile(
                        selectedColor:
                            colorChangeSeven == true ? white : mainColor,
                        selected: true,
                        selectedTileColor:
                            colorChangeSeven == true ? mainColor : white,
                        leading: Image.asset(
                          'assets/share.png',
                          color: colorChangeSeven == true ? white : mainColor,
                        ),
                        title: Text("Share app"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                          side: BorderSide(
                              color: colorChangeSeven == true ? white : white),
                        ),
                        onTap: () {
                          setState(() {
                            colorChangeSeven = !colorChangeSeven;
                            print(colorChangeSeven);
                          });
                        },
                      ),
                      ListTile(
                        selectedColor:
                            colorChangeEight == true ? white : mainColor,
                        selected: true,
                        selectedTileColor:
                            colorChangeEight == true ? mainColor : white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                          side: BorderSide(
                            color: colorChangeEight == true ? white : white,
                          ),
                        ),
                        tileColor: white,
                        leading: Image.asset(
                          'assets/delete.png',
                          color: colorChangeEight == true ? white : mainColor,
                        ),
                        title: Text("Delete account"),
                        onTap: () {
                          // Navigator.of(context);
                          setState(() {
                            colorChangeEight = !colorChangeEight;
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: AlertDialog(
                                        //  titlePadding:EdgeInsets.symmetric(vertical: 2,),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        alignment: Alignment.center,
                                        title: const Text(
                                          'Confirmation',
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                        content: const Text(
                                          'Do you want to delete this account',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 42),
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                    // side: BorderSide(),
                                                  ),
                                                  backgroundColor: mainColor,
                                                ),
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 42),
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
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
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          });
                          print(colorChangeEight);
                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return BackdropFilter(
                          //         filter:
                          //             ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(20),
                          //           child: AlertDialog(
                          //             //  titlePadding:EdgeInsets.symmetric(vertical: 2,),
                          //             contentPadding:
                          //                 EdgeInsets.symmetric(vertical: 2),
                          //             shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(18),
                          //             ),
                          //             alignment: Alignment.center,
                          //             title: const Text(
                          //               'Confirmation',
                          //               style: TextStyle(
                          //                   fontSize: 28,
                          //                   fontWeight: FontWeight.w600),
                          //               textAlign: TextAlign.center,
                          //             ),
                          //             content: const Text(
                          //               'Do you want to delete this account',
                          //               style: TextStyle(
                          //                   fontSize: 18,
                          //                   fontWeight: FontWeight.w500),
                          //               textAlign: TextAlign.center,
                          //             ),
                          //             actions: <Widget>[
                          //               Row(
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.start,
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.spaceAround,
                          //                 children: [
                          //                   TextButton(
                          //                     style: TextButton.styleFrom(
                          //                       padding: EdgeInsets.symmetric(
                          //                           horizontal: 42),
                          //                       textStyle: Theme.of(context)
                          //                           .textTheme
                          //                           .labelLarge,
                          //                       shape: RoundedRectangleBorder(
                          //                         borderRadius:
                          //                             BorderRadius.circular(
                          //                                 18.0),
                          //                         // side: BorderSide(),
                          //                       ),
                          //                       backgroundColor: mainColor,
                          //                     ),
                          //                     child: const Text(
                          //                       'Yes',
                          //                       style: TextStyle(
                          //                           color: Colors.white,
                          //                           fontSize: 17,
                          //                           fontWeight:
                          //                               FontWeight.w700),
                          //                     ),
                          //                     onPressed: () {
                          //                       Navigator.of(context).pop();
                          //                     },
                          //                   ),
                          //                   TextButton(
                          //                     style: TextButton.styleFrom(
                          //                       padding: EdgeInsets.symmetric(
                          //                           horizontal: 42),
                          //                       textStyle: Theme.of(context)
                          //                           .textTheme
                          //                           .labelLarge,
                          //                       shape: RoundedRectangleBorder(
                          //                         borderRadius:
                          //                             BorderRadius.circular(
                          //                                 18.0),
                          //                         // side: BorderSide(),
                          //                       ),
                          //                       backgroundColor: mainColor,
                          //                     ),
                          //                     child: const Text(
                          //                       'No',
                          //                       style: TextStyle(
                          //                         color: Colors.white,
                          //                         fontSize: 17,
                          //                         fontWeight: FontWeight.w700,
                          //                       ),
                          //                     ),
                          //                     onPressed: () {
                          //                       Navigator.of(context).pop();
                          //                     },
                          //                   ),
                          //                 ],
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     });
                        },
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: greyLightText,
                              ),
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Image.asset('assets/line_logo.png'),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                // backgroundColor: lightText,
                                radius: 25,
                                backgroundColor: greyLightText,

                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/profile_photo.png',
                                  ),
                                  radius: 38,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Sarah Shahi',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: greyLightText),
                                  ),
                                  Text(
                                    '@Sarah Shahi',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: greyLightText),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        title: BigText(
          color: white,
          textLabel: 'Home',
          fontWeight: FontWeight.w700,
          fontSize: 26,
        ),
        // Text(
        //   'Home',
        //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
        //   textAlign: TextAlign.center,
        // )

        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset('assets/drawer_icon.png'),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: mainColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: mainColor),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: PopupMenuButton(
constraints: BoxConstraints(
  maxWidth: 130,
),
position: PopupMenuPosition.over,
padding: EdgeInsets.symmetric(horizontal: 0),
                onSelected: (value) {
                 

                  setState(() {
                   
                    _onMenuItemSelected(value as int);
                  });

                  
                },
                color: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                offset: const Offset(-8, -140),
                itemBuilder: (BuildContext bc) => [
                  _buildPopupMenuItem(
                    'Add invoice',
                    Image.asset(
                      'assets/receipt.png',
                    ),
                    Options.search.index,
                  ),
                  _buildPopupMenuItem(
                    'Add estimate',
                    Image.asset(
                      'assets/estimate.png',
                    ),
                    Options.upload.index,
                  ),
                  _buildPopupMenuItem(
                    'Add client',
                    Image.asset(
                      'assets/clients.png',
                    ),
                    Options.copy.index,
                  ),
                  // _buildPopupMenuItem('Exit', Image.asset('assets/122.png'),ValueKey('Exit'),),
                ],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.add, size: 35, color: white),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                      fontSize: 18,
                      color: lightText,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      //<-- SEE HERE
                      side: BorderSide(
                        color: mainColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Let’s start!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: mainColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Complete the tasks below to get to know the app',
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: lightText),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: RichText(
                                  text: TextSpan(
                                      text: '20%',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Completed',
                                          style: TextStyle(
                                            color: lightText,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ]),
                                )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5),
                            child: LinearPercentIndicator(
                              animateFromLastPercent: true,
                              barRadius: const Radius.circular(20),
                              width: 300.0,
                              lineHeight: 14.0,
                              percent: 0.2,
                              backgroundColor: Colors.grey,
                              progressColor: mainColor,
                              animation: true,
                              animationDuration: 1000,
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  child: CheckboxListTile(
                                    visualDensity: VisualDensity.compact,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    contentPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 5),
                                    onChanged: (value) {
                                      if (checkboxStatus[index] == false) {
                                        1 / checkList.length;
                                      } else {
                                        1 / checkList.length;
                                      }
                                      setState(() => checkboxStatus[index] =
                                          !checkboxStatus[index]);
                                    },
                                    value: checkboxStatus[index],
                                    side: BorderSide(color: lightText),
                                    activeColor: mainColor,
                                    checkboxShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    title: Text(
                                      checkList[index],
                                      style: TextStyle(
                                          fontSize: 14, color: lightText),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                              itemCount: checkList.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Overview',
                  style: TextStyle(
                      fontSize: 18,
                      color: lightText,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 384,
                height: 100,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    //<-- SEE HERE
                    side: BorderSide(
                      color: mainColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Unpaid invoices (0)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '£ 0.00',
                            style: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 384,
                height: 100,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    //<-- SEE HERE
                    side: BorderSide(
                      color: mainColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Unsent invoices (0)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '£ 0.00',
                            style: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 384,
                height: 100,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    //<-- SEE HERE
                    side: BorderSide(
                      color: mainColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Overdue invoices (0)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '£ 0.00',
                            style: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 384,
                height: 100,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    //<-- SEE HERE
                    side: BorderSide(
                      color: mainColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Pending estimates (0)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '£ 0.00',
                            style: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w500,
                              color: lightText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 6,
                      blurRadius: 7,
                      offset: Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
