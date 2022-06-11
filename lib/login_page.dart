import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'LoginModel.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/suricata.png',
                  scale: 4,
                ),
                TextFormField(
                  controller: txtUsername,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                      hintText: "Masukan Username",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orange)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      )),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: txtPassword,
                  cursorColor: Colors.orange,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Masukan Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.orange)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      )),
                ),
                const SizedBox(height: 12),
                ButtonTheme(
                    height: 50,
                    minWidth: double.infinity,
                    buttonColor: Colors.orange,
                    child: RaisedButton(
                        onPressed: () {
                          this._doLogin();
                          // String username = txtUsername.text;
                          // String password = txtPassword.text;
                          // if (username == "admin" && password == "admin") {}
                        },
                        child: const Text("Login",
                            style: TextStyle(color: Colors.white)))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _doLogin() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(context: context, title: "Data Tidak Benar", type: AlertType.error)
          .show();
      return;
    }

    // ProgressDialog progressDialog = ProgressDialog(context);
    // progressDialog.style(message: "Loading....");
    // progressDialog.show();
    // 'php artisan passport:install' in ubuntu server to connect
    final response = await http.post(
        Uri.parse('http://10.10.15.98:8080/api/login'),
        body: {'username': txtUsername.text, 'password': txtPassword.text},
        headers: {'Accept': 'application/json'});
    // progressDialog.hide();

    if (response.statusCode == 200) {
      final loginModel = loginModelFromJson(response.body);
      var token = loginModel.data.token;
      // SpUtil.putString("token", token);
      // SpUtil.putString("name", loginModel.data.user.name);
      Navigator.pushReplacementNamed(context, 'home-page');

      // print(loginModel.data.token);
      // print(loginModel.data.token);

      // var responseDecode = jsonDecode(response.body);
      // bool success = responseDecode['success'];
      // var data = responseDecode['data'];
      // var user = data['user'];
      // var token = data['token'];
      Alert(context: context, title: "Login Berhasil", type: AlertType.success)
          .show();
    } else {
      print(response.body);
      Alert(context: context, title: "Login Gagal", type: AlertType.error)
          .show();
    }
  }
}
