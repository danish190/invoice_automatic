import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_automatic/screeens/home_screen.dart';
import 'package:invoice_automatic/screeens/invoices_screen.dart';

import 'package:invoice_automatic/utils/colors.dart';
import 'cilent_screen.dart';
import 'estimates_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final String title;
  const WelcomeScreen({super.key, required this.title});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  final appTitle = 'Flutter Drawer Demo';
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text(
      //     widget.title,
      //     style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
      //     textAlign: TextAlign.center,
      //   ),
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: Image.asset('assets/drawer_icon.png'),
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //       );
      //     },
      //   ),
      //   backgroundColor: mainColor,
      // ),
      body: PageView(
        children: [
          HomeScreen(pageController: pageController),
          InvoiceScreen(
            title: 'Invoices',
          ),
          Client(
            title: 'Client',
          ),
          Estimates(title: 'Estimates'),
        ],
        onPageChanged: onPageChanged,
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
      drawer: Drawer(
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
                  selectedColor: mainColor,
                  selected: true,
                  leading: Image.asset('assets/business_overview.png'),
                  title: Text("Business Overview"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: mainColor,
                  selected: true,
                  leading: Image.asset('assets/profile.png'),
                  title: Text("Proflie"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: mainColor,
                  selected: true,
                  leading: Image.asset('assets/language.png'),
                  title: Text("Language"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: mainColor,
                  selected: true,
                  leading: Image.asset('assets/pending_payment.png'),
                  title: Text("Pending Payment"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: mainColor,
                  selected: true,
                  leading: Image.asset('assets/report.png'),
                  title: Text("Report"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: mainColor,
                  selected: true,
                  leading: Image.asset('assets/help.png'),
                  title: Text("Help"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: mainColor,
                  selected: true,
                  leading: Image.asset('assets/share.png'),
                  title: Text("Share app"),
                  onTap: () {
                    Navigator.pop(context);
                    print('mld');
                  },
                ),
                ListTile(
                  selectedColor: white,
                  selected: true,
                  selectedTileColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                    side: BorderSide(color: mainColor),
                  ),
                  tileColor: white,
                  leading: Image.asset(
                    'assets/delete.png',
                    color: white,
                  ),
                  title: Text("Delete account"),
                  onTap: () {
                    // Navigator.of(context);
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
      bottomNavigationBar:
      CupertinoTabBar(
        activeColor: greyLightText,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 30,
                    child: Image.asset(
                      'assets/Home.png',
                      color: _page == 0 ? mainColor : greyLightText,
                    )),
                Expanded(
                    child: Text(
                  'Home',
                  style: TextStyle(
                      color: _page == 0 ? mainColor : greyLightText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ))
              ],
            ),

            // label: 'HOME',

            backgroundColor: mainColor,
          ),
          BottomNavigationBarItem(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 30,
                    child: Image.asset(
                      'assets/receipt.png',
                      color: _page == 1 ? mainColor : greyLightText,
                    )),
                Expanded(
                  child: Text(
                    'Invoices',
                    style: TextStyle(
                        color: _page == 1 ? mainColor : greyLightText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/clients.png',
                      color: _page == 2 ? mainColor : greyLightText,
                    )),
                Expanded(
                    child: Text(
                  'Clients',
                  style: TextStyle(
                      color: _page == 2 ? mainColor : greyLightText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ))
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 30,
                    child: Image.asset(
                      'assets/estimate.png',
                      color: _page == 3 ? mainColor : greyLightText,
                    )),
                Expanded(
                    child: Text(
                  'Estimates',
                  style: TextStyle(
                      color: _page == 3 ? mainColor : greyLightText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ))
              ],
            ),
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
