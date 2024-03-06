import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';

class InvoicesForm extends StatefulWidget {
  final String title;
  const InvoicesForm({super.key, required this.title});

  @override
  State<InvoicesForm> createState() => _InvoicesFormState();
}

class _InvoicesFormState extends State<InvoicesForm> {
  final myController = TextEditingController();

  TextEditingController textarea = TextEditingController();
  final List<String> selectLanguages = <String>[
  
    
  ];
  bool showWidget = false;
  bool showRow = false;
  DateTime selectedDate = DateTime.now();
  var formatedtime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

        formatedtime = DateFormat('dd/MMM/yy').format(selectedDate);
        print(formatedtime);
        //  print(selectedDate);
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textarea.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26), 
     ),
     toolbarHeight: 80,
        backgroundColor: mainColor,
      ),
      body: SafeArea(
        child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 2),
          padding: EdgeInsets.only(
         bottom: MediaQuery.of(context).viewInsets.bottom, top: 2,left: 20,right: 20),

          
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                '8 Nov',
                style: TextStyle(
                  fontSize: 15,
                  color: mainColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Invoices ',
                    style: TextStyle(
                      fontSize: 18,
                      color: mainColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    child: Image.asset('assets/edit.png'),
                    onTap: () {},
                  )
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Bill To',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: lightText,
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    SizedBox(
                      height: 43.0,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'Enter invoice name',
                          hintStyle: TextStyle(
                            fontSize: 12,
    color: inputHintTextColor
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
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Bill To',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: lightText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 43.0,
                      child: TextField(
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 1), 
    
                          prefixIcon: Image.asset('assets/edit_contact.png'),
                          suffixIcon: Icon(
                            Icons.add,
                            color: mainColor,
                          ),
                          hintText: 'Add client',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: lightText, fontWeight: FontWeight.w400,
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
                    SizedBox(
                      height: 5,
                    ),
                    showRow
                        ? Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: mainColor, //color of border
                                  width: 1, //width of border
                                ),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Expanded(
                            
                              child: ListView.builder(
                                
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: selectLanguages.length,
                                  
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(selectLanguages[index]),
                                       Text(selectLanguages[index]),
                                        Text(selectLanguages[index]),
                                      ],
                                    );
                                  }),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        ' Items',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: lightText),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 43.0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showWidget = !showWidget;
                          });
                        },
                        child: TextField(
                         
                          decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.symmetric(horizontal: 1), 
                            prefixIconConstraints:
                                BoxConstraints.tight(Size(45, 20)),
                            prefixIcon: Image.asset(
                              'assets/edit_add.png',
                            ),
                            enabled: false,
                            hintText: 'Add items',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: lightText,
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
                    SizedBox(
                      height: 20,
                    ),
                    showWidget
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 130,
                                height: 45,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: mainColor,
                                        style: BorderStyle.solid,
                                        width: 2),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets
                                                        .symmetric(
                                                    horizontal: 15),
                                                child: Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Add item',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: lightText,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w700),
                                                      textAlign:
                                                          TextAlign.left,
                                                    )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextField(
                                      
                                                  controller: textarea,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: 3,
                                                  maxLength: 300,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 10,
                                                    ),
                                                    hintText:
                                                        'Enter item name ',
                                                    hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: lightText,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: mainColor,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                        10.0,
                                                      ),
                                                    ),
                                                    border:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                        10.0,
                                                      ),
                                                      borderSide:
                                                          BorderSide(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                         
                                                 
                                                 setState(() {
                                                  selectLanguages.add(textarea.text);
                                                 });
                                      
                                                       textarea.clear();
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  width: 75,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: mainColor,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Add',
                                                      style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '  Add items',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w400,
                                            color: lightText,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showRow = !showRow;
                                            });
                                          },
                                          child: Image.asset(
                                            'assets/edit_add.png',
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                height: 45,
                                child: TextField(
                                  style: TextStyle(color: lightText),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    hintText: 'Price',
                                    suffixIconConstraints:
                                        BoxConstraints.tight(Size(50, 20)),
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: lightText,
                                      fontWeight: FontWeight.w400
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
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 45,
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    hintText: 'Quantity',
                                    suffixIconConstraints:
                                        BoxConstraints.tight(Size(50, 20)),
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: lightText,
                                      fontWeight: FontWeight.w500
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
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Discount ',
                        style: TextStyle(
                            fontSize: 15,
                            color: lightText,
                            fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                            text: ' (optional)',
                            style: TextStyle(
                                fontSize: 8, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              hintText: '12.00',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: lightText,
                                fontWeight: FontWeight.w400
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
                        Text(
                          '  %',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: lightText,
                          ),
                        ),
                        Radio(
                          activeColor: mainColor,
                          value: '',
                          groupValue: '',
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        Text(
                          '( percentile discout )',
                          style: TextStyle(
                            fontSize: 9.33,
                            fontWeight: FontWeight.w600,
                            color: lightText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: mainColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Text(
                                  'chair',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: lightText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Text(
                                  '£33.00 ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: lightText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: mainColor,
                            thickness: 1,
                            indent: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Text(
                                  'Discount',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: lightText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Text(
                                  '£12.00',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: lightText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: mainColor,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: lightText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Text(
                                  '£21.00',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: lightText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,),
                      child: Text(
                        'Due Date',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: lightText,
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: mainColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,),
                            child: Text(
                              formatedtime != null
                                  ? "${formatedtime.toString().split('/')[0]} ${formatedtime.toString().split('/')[1]} ${formatedtime.toString().split('/')[2]}"
                                  : 'Due Date',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: lightText,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Text(
                              formatedtime != null
                                  ? '${formatedtime.toString().split('/')[0]} ${formatedtime.toString().split('/')[1]}'
                                  : 'Select Date',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: lightText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 10,),
                      child: Text(
                        'ADD notes',
                        style: TextStyle(
                            fontSize: 15,
                            color: lightText,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: textarea,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      // maxLength: 5000,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 15,
                    
                        ),
                        hintText:
                            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim',
                        hintStyle: TextStyle(
                          fontSize: 9.0,
                          color: lightText,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            12.0,
                          
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: mainColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ),
                          borderSide: BorderSide(
                            width: 1,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
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
                        print('Save');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
