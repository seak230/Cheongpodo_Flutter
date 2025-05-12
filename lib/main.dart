import 'package:cheongpodo_flutter/screens/auth/auth_screen.dart';
import 'package:cheongpodo_flutter/screens/home/home_screen.dart';
import 'package:cheongpodo_flutter/viewmodels/auth_viewmodel.dart';
import 'package:cheongpodo_flutter/viewmodels/news_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
      ],
      child: MyApp()
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
