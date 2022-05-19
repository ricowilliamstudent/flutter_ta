import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "login-page");
              },
            )
          ],
          backgroundColor: Colors.orange),
      body: SingleChildScrollView(
        child: Column(children: [Text("Selamat Datang")]),
      ),
    );
  }
}
