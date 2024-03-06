import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_automatic/network/api_client.dart';
import 'package:invoice_automatic/screeens/multipage_builder.dart';
import 'package:invoice_automatic/screeens/welcome_screen.dart';
import 'package:invoice_automatic/utils/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/big_test.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool _obscureText = true;
  bool passwordVisible = false;
  bool newPasswordVisible = false;
  late String password;
  void passwordToggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> login({required String email, required String password}) async {
    if (email.isEmpty) {
      Get.snackbar("Error", "Email cannot be empty");
    } else if (password.isEmpty) {
      Get.snackbar("Error", "Password cannot be empty");
    } else if (password.length < 6) {
      Get.snackbar("Error", "Password cannot less than 6");
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Email is not in right format");
    } else {
      dynamic response =
          await ApiClient.loginApi(email: email, password: password);
      if (response.status == true) {
        Get.snackbar("", "Sucessfully login!");

        debugPrint("Sucessful login");
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WelcomeScreen(
                      title: 'Home',
                    )),
          );
        });
      } else {
        Get.snackbar("Error", "Email or password does not match");

        debugPrint(response.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    bool newPasswordVisible = true;
  }

  @override
  void dispose() {
    
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/122.png",
              ),
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
              opacity: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 250,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Sign to continue',
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          height: 1),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: BigText(
                          color: lightText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          textLabel: 'Email',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 8), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                              prefixIcon:
                                  Image.asset('assets/profile_logo.png'),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: inputHintTextColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mainColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Text(
                          '   Password',
                          style: TextStyle(
                            color: lightText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _passwordTextController,
                            onTap: passwordToggle,
                            validator: (val) =>
                                val!.length < 6 ? 'Password too short.' : null,
                            onSaved: (val) => password = val!,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.lock,
                                color: inputHintTextColor,
                                size: 20,
                              ),
                              prefixIcon:
                                  Image.asset('assets/password_logo.png'),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: inputHintTextColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mainColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    // color: Colors.grey, width: 0.0
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: GestureDetector(
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Dialog(
                                // elevation: 0,

                                backgroundColor: white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: SizedBox(
                                  height: 370,
                                  width: 400,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 65,
                                          width: 65,
                                          child: Image.asset(
                                            'assets/lock.png',
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'FORGOT ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 28.22,
                                            color: blackText,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'PASSWORD',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 28.22,
                                            color: blackText,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 200,
                                        child: Text(
                                          "Provid your account’s email for which you want to reset you password!",
                                          style: TextStyle(
                                              color: blackText,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: SizedBox(
                                          height: 40,
                                          width: 300,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Type your email',
                                              hintStyle: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: inputHintTextColor,
                                              ),
                                              prefixIcon: Icon(
                                                Icons.email_outlined,
                                                size: 22,
                                                color: inputHintTextColor,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: mainColor,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                    // color: Colors.grey, width: 0.0
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: SizedBox(
                                          height: 40,
                                          width: 300,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: white,
                                                side: BorderSide(
                                                    width: 2, color: mainColor),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(80),
                                                ),
                                                padding: EdgeInsets.all(10),
                                                backgroundColor: mainColor),
                                            onPressed: () => showDialog<String>(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                alignment: Alignment.center,
                                                elevation: 0,
                                                backgroundColor: white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                actions: <Widget>[
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  SizedBox(
                                                    width: 300,
                                                    height: 80,
                                                    child: Center(
                                                      child: Image.asset(
                                                        'assets/lock.png',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 300,
                                                    height: 100,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        showDialog<String>(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              Dialog(
                                                            backgroundColor:
                                                                white,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0)),
                                                            child: SizedBox(
                                                              height: 340,
                                                              width: 400,
                                                              child: Column(
                                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          65,
                                                                      width: 65,
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/lock.png',
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Enter 4 ',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                  Text(
                                                                    'Digits Code',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 250,
                                                                    child: Text(
                                                                      'Enter the 4 digits code that you received on your email.',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            13.04,
                                                                        color:
                                                                            black,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          200,
                                                                      child:
                                                                          PinCodeTextField(
                                                                        appContext:
                                                                            context,
                                                                        length:
                                                                            4,
                                                                        textStyle:
                                                                            TextStyle(color: mainColor),
                                                                        onChanged:
                                                                            (value) {
                                                                          print(
                                                                              value);
                                                                        },
                                                                        pinTheme:
                                                                            PinTheme(
                                                                          shape:
                                                                              PinCodeFieldShape.box,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                          fieldHeight:
                                                                              40,
                                                                          fieldWidth:
                                                                              40,
                                                                          inactiveColor:
                                                                              mainColor,
                                                                          activeColor:
                                                                              mainColor,
                                                                          selectedColor:
                                                                              mainColor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 40,
                                                                    width: 300,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .symmetric(
                                                                        horizontal:
                                                                            30,
                                                                      ),
                                                                      child:
                                                                          ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            primary: white,
                                                                            side: BorderSide(width: 2, color: mainColor),
                                                                            shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(14),
                                                                            ),
                                                                            padding: EdgeInsets.all(4),
                                                                            backgroundColor: mainColor),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context, rootNavigator: true)
                                                                              .pop();
                                                                          showDialog<
                                                                              String>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return AlertDialog(
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                                                content: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                                                                  return SizedBox(
                                                                                    height: 450,
                                                                                    width: 400,
                                                                                    child: Column(
                                                                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          height: 25,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: SizedBox(
                                                                                            height: 65,
                                                                                            width: 65,
                                                                                            child: Image.asset(
                                                                                              'assets/lock.png',
                                                                                              width: 100,
                                                                                              height: 100,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          'Reset',
                                                                                          style: TextStyle(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontSize: 28,
                                                                                            color: blackText,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          'Password',
                                                                                          style: TextStyle(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontSize: 28,
                                                                                            color: blackText,
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 270,
                                                                                          child: Text(
                                                                                            'Set the new password for your account so you can login and access all the features.',
                                                                                            style: TextStyle(
                                                                                              fontSize: 13.04,
                                                                                              color: blackText,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                            textAlign: TextAlign.center,
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(16.0),
                                                                                          child: SizedBox(
                                                                                            width: 250,
                                                                                            height: 40,
                                                                                            child: TextField(
                                                                                              textInputAction: TextInputAction.done,
                                                                                              obscureText: newPasswordVisible,
                                                                                              decoration: InputDecoration(
                                                                                                suffixIcon: IconButton(
                                                                                                  onPressed: () {
                                                                                                    setState(() {
                                                                                                      newPasswordVisible = !newPasswordVisible;
                                                                                                    });
                                                                                                  },
                                                                                                  icon: Icon(
                                                                                                    newPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                                                                                    color: mainColor,
                                                                                                  ),
                                                                                                ),

                                                                                                //  Image.asset('assets/lock_eye.png'),
                                                                                                contentPadding: EdgeInsets.symmetric(
                                                                                                  horizontal: 10,
                                                                                                ),
                                                                                                hintText: 'New Password',
                                                                                                hintStyle: TextStyle(
                                                                                                  fontSize: 13,
                                                                                                  fontWeight: FontWeight.w400,
                                                                                                  color: inputHintTextColor,
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: mainColor,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                ),
                                                                                                border: OutlineInputBorder(
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                  borderSide: BorderSide(
                                                                                                      // color: Colors.grey, width: 0.0
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.only(left: 20, right: 20),
                                                                                          child: SizedBox(
                                                                                            width: 250,
                                                                                            height: 40,
                                                                                            child: TextField(
                                                                                              keyboardType: TextInputType.visiblePassword,
                                                                                              textInputAction: TextInputAction.done,
                                                                                              obscureText: passwordVisible,
                                                                                              decoration: InputDecoration(
                                                                                                suffixIcon: IconButton(
                                                                                                  onPressed: () {
                                                                                                    setState(() {
                                                                                                      passwordVisible = !passwordVisible;
                                                                                                    });
                                                                                                  },
                                                                                                  icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off, color: mainColor),
                                                                                                ),
                                                                                                // suffixIcon: Image.asset('assets/lock_eye.png'),
                                                                                                contentPadding: EdgeInsets.symmetric(
                                                                                                  horizontal: 10,
                                                                                                ),
                                                                                                hintText: 'Re-enter Password',
                                                                                                hintStyle: TextStyle(fontSize: 13, color: inputHintTextColor, fontWeight: FontWeight.w300),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: mainColor,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                ),
                                                                                                border: OutlineInputBorder(
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                  borderSide: BorderSide(
                                                                                                      // color: Colors.grey, width: 0.0
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 20,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 40,
                                                                                          width: 250,
                                                                                          child: ElevatedButton(
                                                                                            style: ElevatedButton.styleFrom(
                                                                                                primary: white,
                                                                                                side: BorderSide(width: 2, color: mainColor),
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(30),
                                                                                                ),
                                                                                                // padding: EdgeInsets.all(6),
                                                                                                backgroundColor: mainColor),
                                                                                            onPressed: () {
                                                                                              Navigator.push(
                                                                                                context,
                                                                                                MaterialPageRoute(
                                                                                                    builder: (context) => const WelcomeScreen(
                                                                                                          title: 'Home',
                                                                                                        )),
                                                                                              );

                                                                                              // Navigator.push(
                                                                                              //   context,
                                                                                              //   MaterialPageRoute(builder: (context) => const MultiPager()),
                                                                                              // );
                                                                                            },
                                                                                            child: Text(
                                                                                              'Update Password',
                                                                                              style: TextStyle(
                                                                                                color: white,
                                                                                                fontWeight: FontWeight.w700,
                                                                                                fontSize: 19.51,
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Reset Password',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                white,
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            fontSize:
                                                                                19.51,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 300,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(13.0),
                                                          child: Text(
                                                            "An email has been dispatched to your email address. Remember to check your spam folder as well.",
                                                            style: TextStyle(
                                                              color: blackText,
                                                              fontSize: 13.01,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Reset Password',
                                                style: TextStyle(
                                                  color: white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
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
                          ),
                          child: Container(
                            child: Text(
                              "  Forgot password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: lightText,
                                  fontSize: 12),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: white, //background color of button
                              side: BorderSide(
                                  width: 2,
                                  color: mainColor), //border width and color
                              // elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.all(10),
                              backgroundColor: mainColor),
                          onPressed: () {
                            login(
                                email: _emailTextController.text,
                                password: _passwordTextController.text);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                'Login ',
                                style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Don\'t have an account?',
                              style: TextStyle(
                                  color: lightText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Sign up',
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MultiPager(),
                                          ),
                                        );
                                      });
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
