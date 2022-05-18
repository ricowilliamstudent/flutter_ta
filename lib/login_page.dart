import 'package:flutter/material.dart';
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

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
                  decoration: InputDecoration(hintText: "Masukan Username"),
                ),
                TextFormField(
                  controller: txtPassword,
                  cursorColor: Colors.orange,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Masukan Password"),
                ),
                ButtonTheme(
                    minWidth: double.infinity,
                    buttonColor: Colors.orange,
                    child: RaisedButton(
                        onPressed: () {
                          this._doLogin();
                          // String username = txtUsername.text;
                          // String password = txtPassword.text;
                          // if (username == "admin" && password == "admin") {}
                          // percobaan
                        },
                        child: Text("Login",
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

    final response = await http.post(
        Uri.parse('http://localhost:8000/api/login'),
        body: {'username': txtUsername.text, 'password': txtPassword.text},
        headers: {'Accept': 'application/json'});
    // progressDialog.hide();

    if (response.statusCode == 200) {
      Alert(context: context, title: "Login Berhasil", type: AlertType.success)
          .show();
    } else {
      Alert(context: context, title: "Login Gagal", type: AlertType.error)
          .show();
    }
  }
}
