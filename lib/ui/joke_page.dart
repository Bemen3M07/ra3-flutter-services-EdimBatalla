import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hello_world/core/provider/joke_provider.dart';

class JokePage extends StatefulWidget {
  const JokePage({super.key});

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<JokeProvider>().loadRandomJoke());
  }

  @override
  Widget build(BuildContext context) {
    final p = context.watch<JokeProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Acudits')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Builder(
                  builder: (_) {
                    if (p.isLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (p.error != null) {
                      return Text('Error: ${p.error}');
                    }
                    if (p.current == null) {
                      return const Text('Sense acudit.');
                    }
                    final setup = p.current!.setup ?? '';
                    final punchline = p.current!.punchline ?? '';
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          setup.isEmpty ? '(sense text)' : setup,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          punchline,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: p.isLoading ? null : p.loadRandomJoke,
                child: const Text('Nou acudit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
