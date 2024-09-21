import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/views/event/index_page.dart';
import 'package:ticketapp/views/widgets/app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moovin',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const Scaffold(
        appBar: CustomAppBar(),
        body: EventIndexPage()
      ),
    );
  }
}
