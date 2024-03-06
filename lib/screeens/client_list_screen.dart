import 'package:flutter/material.dart';
import 'package:invoice_automatic/utils/colors.dart';
import '../widgets/client_list_widget.dart';
import 'client_info_screen.dart';

class ClientList extends StatefulWidget {
  final String title;
  const ClientList({super.key, required this.title});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
        ),
        backgroundColor: mainColor,
        toolbarHeight: 80,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ClientInfoPage(title: 'Client Info '),
                                  ),
                                );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ClientListWidget(
                  textEmail: '',
                  textName: '',
                  textWebsite: '',
                  image: Image.asset('assets/profile_photo.png'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
