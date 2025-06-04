import 'package:cheongpodo_flutter/screens/auth/auth_screen.dart';
import 'package:cheongpodo_flutter/screens/tutorial/grapes_screen.dart';
import 'package:cheongpodo_flutter/viewmodels/auth_viewmodel.dart';
import 'package:cheongpodo_flutter/viewmodels/news_viewmodel.dart';
import 'package:cheongpodo_flutter/viewmodels/term_viewmodel.dart';
import 'package:cheongpodo_flutter/viewmodels/tutorial_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const AppTest());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => TermViewModel()),
        ChangeNotifierProvider(create: (_) => TutorialViewmodel()),
      ],
      child: MyApp()
    ),
  );
}

// class AppTest extends StatelessWidget {
//   const AppTest({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: GrapesScreen(),
//     );
//   }
// }

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
