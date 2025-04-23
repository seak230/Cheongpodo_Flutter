import 'package:cheongpodo_flutter/routes.dart';
import 'package:cheongpodo_flutter/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyStatefulWidget(),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: '아이디'),
            ),
            TextField(
              controller: pwController,
              obscureText: true,
              decoration: InputDecoration(labelText: '비밀번호'),
            ),
            ElevatedButton(
              onPressed: () async {
                viewModel.login(
                  idController.text,
                  pwController.text,
                );

                final success = await viewModel.login(
                  idController.text,
                  pwController.text,
                );

                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('로그인 성공')),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => MyStatefulWidget()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('로그인 실패')),
                  );
                }
              },
              child: Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}
