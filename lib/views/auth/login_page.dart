import 'package:flutter/material.dart';
import 'package:ticketapp/views/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login Page', style: TextStyle(fontSize: 30)),
              const SizedBox(
                height: 30,
              ),
              InputWidget(
                hintText: 'Email',
                controller: _emailController,
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              InputWidget(
                hintText: 'Password',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 50),
                )),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Register', style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
