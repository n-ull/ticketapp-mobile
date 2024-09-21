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
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
            BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Agenda'),
          ],
        ),
        appBar: const CustomAppBar(),
        body: const EventIndexPage()
      ),
    );
  }
}
