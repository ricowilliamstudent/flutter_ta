import 'package:flutter/material.dart';
// import 'package:sp_util/sp_util.dart';
import 'package:realmec2/info_aplikasi.dart';
import 'package:realmec2/log_serangan.dart';

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
          title: const Text("Beranda"),
          backgroundColor: Colors.orange,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "login-page");
              },
            )
          ],
        ),
        backgroundColor: Colors.orange[100],
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 1,
            children: <Widget>[
              Image.asset('images/suricata.png', scale: 2, height: 10),

              //Card Serangan
              Card(
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  // Push ke log serangan
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => logserangan()));
                  },
                  // End push ke log serangan
                  splashColor: Colors.orange,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
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
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  // Push ke info aplikasi
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const infoaplikasi()));
                  },
                  // End ke info aplikasi
                  splashColor: Colors.orange,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
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
