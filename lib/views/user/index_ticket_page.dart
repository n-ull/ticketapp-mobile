import 'package:flutter/material.dart';

class UserIndexTicketPage extends StatefulWidget {
  const UserIndexTicketPage({super.key});

  @override
  State<UserIndexTicketPage> createState() => UserIndexTicketPageState();
}

class UserIndexTicketPageState extends State<UserIndexTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tickets'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text("You don't own any tickets yet."),
      ),
    );
  }
}