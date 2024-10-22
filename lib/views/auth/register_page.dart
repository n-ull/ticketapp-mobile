import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketapp/controllers/authentication.dart';
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
final AuthenticationController _authenticationController =
    Get.put(AuthenticationController());

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackButton(color: Colors.white),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Unete a moovin',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: GoogleFonts.rowdies().fontFamily)),
              const SizedBox(height: 20),
              InputWidget(
                  hintText: 'Nombre',
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
                  hintText: 'Contraseña',
                  controller: _passwordController,
                  obscureText: true),
              const SizedBox(height: 20),
              Obx(() {
                return _authenticationController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await _authenticationController.register(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              name: _nameController.text.trim(),
                              dni: _dniController.text.trim());
                        },
                        child: const Text('Registrarse'),
                      );
              }),
            ]),
          ),
        ));
  }
}
