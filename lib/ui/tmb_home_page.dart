import 'package:flutter/material.dart';
import 'package:flutter_hello_world/ui/tmb_lines_page.dart';

class TmbHomePage extends StatelessWidget {
  const TmbHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMB'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Consulta informació de TMB',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TmbLinesPage(),
                    ),
                  );
                },
                child: const Text('Consultar línies de bus'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
