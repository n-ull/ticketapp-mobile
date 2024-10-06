import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/controllers/authentication.dart';
import 'package:ticketapp/views/auth/register_page.dart';
import 'package:ticketapp/views/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final AuthenticationController _authenticationController =
    Get.put(AuthenticationController());

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
              Obx(() {
                return _authenticationController.isLoading.value ? const CircularProgressIndicator() :
                ElevatedButton(
                  onPressed: () async {
                    await _authenticationController.login(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                  },
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
                );
              }),
              TextButton(
                onPressed: () {
                  Get.to(() => const RegisterPage());
                },
                child: const Text('Register', style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
