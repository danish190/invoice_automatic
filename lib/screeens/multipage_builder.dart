import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_automatic/screeens/welcome_screen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../network/api_client.dart';
import '../utils/colors.dart';

class MultiPager extends StatefulWidget {
  const MultiPager({super.key});

  @override
  State<MultiPager> createState() => _MultiPagerState();
}

class _MultiPagerState extends State<MultiPager> {
  final TextEditingController _firstnameTextController =
      TextEditingController();
  final TextEditingController _secondnameTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passowrdTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  //  Business Details
  final TextEditingController _businessName = TextEditingController();
  final TextEditingController _busineesAddress = TextEditingController();
  final TextEditingController _businessPhoneNumber = TextEditingController();
  final TextEditingController _businessUrl = TextEditingController();

  int activeIndex = 1;
  int totalIndex = 2;
  bool isChecked = false;
  bool isSwitched = false;
  //  XFile? image;

  Future<void> RegistrationBusinessDetails({
    required String profilePicture,
    required String businessName,
    required String bussinessAddress,
    required String businessPhoneNumber,
    required String businessUrl,
  }) async {
    if (profilePicture.isEmpty) {
      Get.snackbar("Error", "Profile picture cannot be empty");
    } else if (businessName.isEmpty) {
      Get.snackbar("Error", "Business name cannot be empty");
    } else if (bussinessAddress.isEmpty) {
      Get.snackbar("Error", "Business addresss cannot be empty");
    } else if (businessPhoneNumber.isEmpty) {
      Get.snackbar("Error", "Businees phone number cannot be empty");
    } else if (businessUrl.isEmpty) {
      Get.snackbar("Error", "Business url cannot be empty");
    }
    if (!GetUtils.isURL(businessUrl)) {
      Get.snackbar("Error", "Businees url is not in right format ");
    } else {
      dynamic response = await ApiClient.profileApi(
          businessName: businessName,
          businessUrl: businessUrl,
          bussinessAddress: bussinessAddress,
          businessPhoneNumber: businessPhoneNumber,
          imagePath: profilePicture);
      if (response.status == true) {
        Get.snackbar("Data", response.message);
        debugPrint("Business Sucessful save");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => WelcomeScreen(
              title: 'Home',
            ),
          ),
        );
      } else {
        Get.snackbar("Error", response.message);

        debugPrint(response.toString());
      }
    }
  }

  Future<void> Registration({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (firstName.isEmpty) {
      Get.snackbar("Error", "Firstname cannot be empty");
    } else if (lastName.isEmpty) {
      Get.snackbar("Error", "Lastname cannot be empty");
    } else if (email.isEmpty) {
      Get.snackbar("Error", "Email cannot be empty");
    } else if (password.isEmpty) {
      Get.snackbar("Error", "Password cannot be empty");
    } else if (password.length < 6) {
      Get.snackbar("Error", "Password cannot be less than 6 character");
    } else if (confirmPassword.isEmpty) {
      Get.snackbar("Error", "Confirm password cannot be empty");
    } else if (confirmPassword.length < 6) {
      Get.snackbar("Error", "Confirm password must be 6 character");
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Email is not in right format");
    } else {
      dynamic response = await ApiClient.registrationApi(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          confirmPassword: confirmPassword);
      if (response.status == true) {
        Get.snackbar("Data", response.message);
        debugPrint("Data Sucessful save");
        ++activeIndex;
      } else {
        Get.snackbar("Error", response.message);

        debugPrint(response.toString());
      }
    }
  }

//  _getFromGallery() async {
//     XFile? pickedFile = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//         maxWidth: 1800,
//         maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//         File imageFile = File(pickedFile.path);
//     }
// }

  ImagePicker picker = ImagePicker();
  XFile? image;
  Widget businessDetails() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Add your Business details',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: lightText),
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 4),
                  child: RichText(
                    text: TextSpan(
                      text:
                          'These details will appear on your invoice, estimates. You can change them anytime by going to ',
                      style: TextStyle(
                        color: lightText,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Company info.',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Circle Avatar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          setState(() {
                            //update UI
                            image == null
                                ? CircleAvatar(
                                    backgroundColor: Colors.black,
                                    backgroundImage: AssetImage(
                                      'assets/r.png',
                                    ),
                                    radius: 120,
                                  )
                                : Image.file(File(image!.path));
                          });
                          // backgroundImage: AssetImage('assets/r.png',),
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),

                          //   backgroundImage:
                          //   AssetImage('assets/default_user.png',),
                          //  backgroundColor: white,
                          //         image == null?Container():
                          // Image.file(File(image!.path))
                          // backgroundColor: white,
                          // radius: 25,
                          child: image == null
                              ? CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/r.png',
                                  ),
                                  radius: 120,
                                )
                              : Image.file(File(image!.path)),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 5,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Icon(
                            Icons.add,
                            color: white,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    // First Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Business name',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        child: TextFormField(
                          controller: _businessName,
                          decoration: InputDecoration(
                            hintText:
                                'Don’t have one? Type your own full name.',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintStyle: TextStyle(
                                fontSize: 12,
                                color: inputHintTextColor,
                                fontWeight: FontWeight.w500),
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

                    SizedBox(
                      height: 10,
                    ),
                    // Second Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Business address',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        child: TextFormField(
                          controller: _busineesAddress,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Don’t have one? Type your home address.',
                            hintStyle: TextStyle(
                                fontSize: 12,
                                color: inputHintTextColor,
                                fontWeight: FontWeight.w500),
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

                    SizedBox(
                      height: 10,
                    ),
                    // Email
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Business phone number',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          controller: _businessPhoneNumber,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'So customers can contact you.',
                            hintStyle: TextStyle(
                                fontSize: 12,
                                color: inputHintTextColor,
                                fontWeight: FontWeight.w500),
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

                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Business URL',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          controller: _businessUrl,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Your website or social media page.',
                            hintStyle: TextStyle(
                                fontSize: 12,
                                color: inputHintTextColor,
                                fontWeight: FontWeight.w500),
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
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Email For Newsletter and new updates',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: lightText),
                        ),
                        Switch(
                          activeTrackColor: mainColor,
                          activeColor: mainColor,
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                        )
                      ],
                    ),
                    // Elevated butoon  Next

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                          child: SizedBox(
                            height: 60,
                            width: 250,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: white,
                                  side: BorderSide(width: 2, color: mainColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: mainColor),
                              onPressed: () {
                                setState(
                                  () {
                                    // Navigator.of(context).pushReplacement(
                                    //   MaterialPageRoute(
                                    //     builder: (BuildContext context) =>
                                    //         WelcomeScreen(
                                    //       title: 'Home',
                                    //     ),
                                    //   ),
                                    // );
                                    RegistrationBusinessDetails(
                                        businessName: _businessName.text,
                                        businessPhoneNumber:
                                            _businessPhoneNumber.text,
                                        businessUrl: _businessUrl.text,
                                        bussinessAddress: _busineesAddress.text,
                                        profilePicture: image!.path.toString());
                                  },
                                );
                              },
                              child: Text(
                                'Next',
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
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'have an account?',
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (activeIndex != 1) {
          activeIndex--;
          setState(() {});
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add your account details',
                style: TextStyle(color: lightText, fontSize: 16),
                // textAlign: TextAlign.start,
              ),
              SizedBox(
                width: 200,
                child: StepProgressIndicator(
                  totalSteps: totalIndex,
                  currentStep: activeIndex,
                  size: 3,
                  padding: 0,
                  selectedColor: mainColor,
                ),
              )
            ],
          ),
          backgroundColor: white,
          centerTitle: true,
          leading: BackButton(
            color: mainColor,
          ),
          elevation: 0,
        ),
        body: bodyBuilder(),
      ),
    );
  }

  Widget bodyBuilder() {
    switch (activeIndex) {
      case 0:
        return basicDetails();
      case 1:
        return basicDetails();

      case 2:
        return businessDetails();
      default:
        return basicDetails();
    }
  }

  Widget basicDetails() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Add your personal details',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: lightText),
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 4),
                  child: RichText(
                    text: TextSpan(
                      text:
                          'These details will appear on your profile screen. Make changes anytime by going to',
                      style: TextStyle(
                        color: lightText,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Personal details.',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    // First Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'First Name',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  Offset(0, 7), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _firstnameTextController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: inputHintTextColor,
                            ),
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

                    SizedBox(
                      height: 10,
                    ),
                    // Second Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Second Name',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  Offset(0, 7), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _secondnameTextController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Second Name',
                            hintStyle: TextStyle(
                                fontSize: 15, color: inputHintTextColor),
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

                    SizedBox(
                      height: 10,
                    ),
                    // Email
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  Offset(0, 7), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _emailTextController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Add Email',
                            hintStyle: TextStyle(
                                fontSize: 15, color: inputHintTextColor),
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

                    SizedBox(
                      height: 10,
                    ),
                    // Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  Offset(0, 7), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _passowrdTextController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontSize: 15, color: inputHintTextColor),
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

                    SizedBox(
                      height: 10,
                    ),
                    // confirm password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Confirm password',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  Offset(0, 7), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _confirmPasswordTextController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Re-enter your password',
                            hintStyle: TextStyle(
                                fontSize: 15, color: inputHintTextColor),
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
                    SizedBox(
                      height: 20,
                    ),
                    // Elevated butoon  Next
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          child: Checkbox(
                              checkColor: white,
                              side: BorderSide(color: mainColor),
                              activeColor: mainColor,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                        ),
                        SizedBox(
                            width: 250,
                            child: Text(
                              'Creating an account means you’re okay with our Terms of Service, Privacy Policy, and our default Notification Settings.',
                              style: TextStyle(
                                  fontSize: 8.0,
                                  color: lightText,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                          child: SizedBox(
                            height: 54,
                            width: 270,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: white,
                                  side: BorderSide(width: 2, color: mainColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: mainColor),
                              onPressed: () {
                                setState(() {
                                  Registration(
                                      firstName:
                                          _firstnameTextController.text.trim(),
                                      lastName:
                                          _secondnameTextController.text.trim(),
                                      email: _emailTextController.text.trim(),
                                      password:
                                          _passowrdTextController.text.trim(),
                                      confirmPassword:
                                          _confirmPasswordTextController.text
                                              .trim());
                                  // activeIndex++;
                                });
                              },
                              child: Text(
                                'Next',
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
              Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'have an account?',
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
