import 'package:flutter/material.dart';
import 'package:ticketapp/views/widgets/input_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _dniController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Register Page', style: TextStyle(fontSize: 30)),
                const SizedBox(height: 20),
                InputWidget(
                    hintText: 'Name',
                    controller: _nameController,
                    obscureText: false),
                const SizedBox(height: 20),
                InputWidget(
                    hintText: 'Email',
                    controller: _emailController,
                    obscureText: false),
                const SizedBox(height: 20),
                InputWidget(
                    hintText: 'DNI',
                    controller: _dniController,
                    obscureText: false),
                const SizedBox(height: 20),
                InputWidget(
                    hintText: 'Password',
                    controller: _passwordController,
                    obscureText: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),]
            ),
          ),
        ));
  }
}
