import 'package:flutter/material.dart';

class logserangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Log Serangan"), backgroundColor: Colors.orange),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/suricata.png',
              scale: 4,
            ),
            const Text('Log Serangan',
                style: TextStyle(
                  height: 1.5,
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}
