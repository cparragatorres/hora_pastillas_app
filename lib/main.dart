import 'package:flutter/material.dart';
import 'package:hora_pastilla/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Asegúrate de que Flutter no ejecute el widget hasta que se complete la inicialización
  WidgetsFlutterBinding.ensureInitialized(); // Asegúrate de que Flutter esté inicializado

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e) {
    // Manejo de errores: puedes registrar el error o mostrar un mensaje
    print('Error inicializando Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: Container(
        color: Colors.deepPurpleAccent,
        child: const SafeArea(
          child: LoginPage(),
        ),
      ),
    );
  }
}
