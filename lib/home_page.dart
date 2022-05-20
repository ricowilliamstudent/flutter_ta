import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:realmec2/info_aplikasi.dart';

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
          title: Text("Beranda"),
          backgroundColor: Colors.orange,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "login-page");
              },
            )
          ],
        ),
        backgroundColor: Colors.orange[100],
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 1,
            children: <Widget>[
              //Card Serangan
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.orange,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.bug_report,
                          color: Colors.orange,
                          size: 70.0,
                        ),
                        Text("LOG SERANGAN",
                            style: new TextStyle(fontSize: 17.0))
                      ],
                    ),
                  ),
                ),
              ),
              //akhir card log serangan

              //Card Info Aplikasi
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => infoaplikasi()));
                  },
                  splashColor: Colors.orange,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.perm_device_information,
                          color: Colors.orange,
                          size: 70.0,
                        ),
                        Text("INFO APLIKASI",
                            style: new TextStyle(fontSize: 17.0))
                      ],
                    ),
                  ),
                ),
              ),
              //Akhir card info aplikasi
            ],
          ),
        ));
  }
}
