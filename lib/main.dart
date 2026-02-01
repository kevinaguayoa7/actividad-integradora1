import 'package:flutter/material.dart';

void main() {
  runApp(const MyFlutterApp());
}

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Flutter Kevin',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void mostrarMensaje(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Botón presionado correctamente'),
        duration: Duration(seconds: 2), // 'duration' is a parameter of SnackBar, not showSnackBar
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Bienvenido a mi aplicación Flutter soy Kevin Aguayo', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const ExpansionTile(
              title: Text('Información del proyecto'),
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Esta aplicación demuestra navegación, interacción y uso de widgets en Flutter'),
                )
              ],
            ),
            const SizedBox(height: 20), // Added missing comma here

            ElevatedButton(
              onPressed: () => mostrarMensaje(context),
              child: const Text('SnackBar'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text('Ir a segunda pantalla'),
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Pantalla De Mi Proyecto'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Estás en la segunda pantalla',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                },
              child: const Text('Volver'), // Added missing 'child' parameter
            ),
          ],
        ),
      ),
    );
  }
}