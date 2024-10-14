import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                  child: const Text(
                    "¡Hora De La Pastilla!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const Text(
                "Iniciar Sesión",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              const SizedBox(height: 36),
              _TextFieldWidget(
                controller: emailController,
                hintText: "Ingrese su correo electrónico",
                prefixIcon: const Icon(
                  CupertinoIcons.person,
                  color: Colors.deepPurpleAccent,
                  size: 24.0,
                ),
              ),
              const SizedBox(height: 30),
              _PasswordField(),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.deepPurpleAccent),
                  fixedSize: WidgetStateProperty.all<Size>(Size.fromWidth(MediaQuery.of(context).size.width)),
                  padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 16.0)),
                ),
                child: const Text(
                  "Iniciar Sesión",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 42),
              const Center(
                child: Text(
                  "O inicia sesión con",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4.0, offset: Offset(0, 4))]),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 42),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "¿No tienes una cuenta? ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Regístrate",
                        style: const TextStyle(color: Colors.deepPurpleAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){

                          }
                      ),
                    ]
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatefulWidget {
  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool isChanged = false;
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _TextFieldWidget(
      controller: _passwordController,
      hintText: "Contraseña",
      prefixIcon: const Icon(
        CupertinoIcons.lock,
        color: Colors.deepPurpleAccent,
        size: 24.0,
      ),
      suffixIcon: IconButton(
        icon: isChanged ? const Icon(CupertinoIcons.eye) : const Icon(CupertinoIcons.eye_slash),
        onPressed: () {
          isChanged = !isChanged;
          setState(() {});
        },
      ),
      obscureText: !isChanged,
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;

  const _TextFieldWidget({
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText!,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.deepPurpleAccent,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.deepPurpleAccent,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
