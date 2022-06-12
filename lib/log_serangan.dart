import 'package:flutter/material.dart';

class logserangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Log Serangan"), backgroundColor: Colors.orange),
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              // Card
              Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.bug_report),
                            Text("IP Address :"),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.timer_sharp),
                            Text("Waktu :"),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                            color: Colors.green,
                            child: Text(
                              'ACCEPT',
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: 30),
                          FlatButton(
                            color: Colors.yellow,
                            child: Text(
                              'REJECT',
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: 30),
                          FlatButton(
                            color: Colors.red,
                            child: Text(
                              'DROP',
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ) //End Card
            ],
          )),
    );
  }
}
