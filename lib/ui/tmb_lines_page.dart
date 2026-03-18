import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hello_world/core/provider/tmb_provider.dart';
import 'package:flutter_hello_world/ui/tmb_stops_page.dart';

class TmbLinesPage extends StatefulWidget {
  const TmbLinesPage({super.key});

  @override
  State<TmbLinesPage> createState() => _TmbLinesPageState();
}

class _TmbLinesPageState extends State<TmbLinesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<TmbProvider>().loadLines());
  }

  @override
  Widget build(BuildContext context) {
    final p = context.watch<TmbProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Línies de Bus')),
      body: Builder(
        builder: (_) {
          if (p.isLoadingLines) {
            return const Center(child: CircularProgressIndicator());
          }

          if (p.error != null) {
            return Center(child: Text('Error: ${p.error}'));
          }

          if (p.lines.isEmpty) {
            return const Center(child: Text('No hi ha línies disponibles'));
          }

          return ListView.separated(
            itemCount: p.lines.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final line = p.lines[i];

              return ListTile(
                title: Text('Línia ${line.code}'),
                subtitle: Text(line.name),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TmbStopsPage(
                        lineCode: line.code,
                        lineName: line.name,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
