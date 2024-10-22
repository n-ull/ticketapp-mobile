import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticketapp/views/auth/login_page.dart';
import 'package:ticketapp/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final token = box.read('token');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moovin',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: token == null ? const LoginPage() : const Home(),
    );
  }
}
