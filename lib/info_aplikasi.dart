import 'package:flutter/material.dart';
import 'package:realmec2/main.dart';

class infoaplikasi extends StatelessWidget {
  const infoaplikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("INFO APLIKASI"), backgroundColor: Colors.orange),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Aplikasi Intrusion Prevention System, Skripsi Rico William'),
          ],
        ),
      ),
    );
  }
}
