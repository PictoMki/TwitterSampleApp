import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ログイン"),
        leading: Container(),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('メールアドレス'),
                  SizedBox(height: 5,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('パスワード'),
                  SizedBox(height: 5,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => _tapRegisterLink(context),
                        child: Text('新規登録',style: TextStyle(color: Colors.blue),),
                      ),
                      Text('はこちら')
                    ],
                  ),
                ],
              ),
              Container(
                width: 280,
                height: 50,
                child: RaisedButton(
                  child: Text('ログイン'),
                  color: Colors.orangeAccent,
                  shape: StadiumBorder(),
                  onPressed: _tapLoginButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapRegisterLink(BuildContext context) {
    Navigator.pushNamed(context, '/sign_up');
  }

  void _tapLoginButton() {

  }
}