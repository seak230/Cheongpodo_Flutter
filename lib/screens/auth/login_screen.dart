import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController id_text = TextEditingController();
    TextEditingController pw_text = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: id_text,
              decoration: InputDecoration(labelText: '아이디'),
            ),
            TextField(
              controller: pw_text,
              decoration: InputDecoration(labelText: '비번'),
            ),
            TextButton(
                onPressed: () {
                  print(id_text.text);
                  print(pw_text.text);
                },
                child: Text('로그인')
            ),
          ],
        ),
      ),
    );
  }
}
