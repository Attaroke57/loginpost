import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpost/page/login_page.dart';
import 'package:loginpost/page/homemenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginPage(), // Atur halaman awal langsung di sini
      getPages: [
        GetPage(name: '/home', page: () => Homemenu()),
      ],
    );
  }
}
