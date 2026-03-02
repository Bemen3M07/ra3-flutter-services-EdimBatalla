import 'package:flutter/material.dart';
import 'package:flutter_hello_world/ui/car_list_page.dart';
import 'package:flutter_hello_world/ui/joke_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pràctica 5d')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CarListPage()),
                ),
                child: const Text('Cars (Exercici 1-2)'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const JokePage()),
                ),
                child: const Text('Acudits (Exercici 3)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
