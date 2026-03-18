import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hello_world/core/provider/tmb_provider.dart';

class TmbArrivalsPage extends StatefulWidget {
  final String lineCode;
  final String stopCode;
  final String stopName;

  const TmbArrivalsPage({
    super.key,
    required this.lineCode,
    required this.stopCode,
    required this.stopName,
  });

  @override
  State<TmbArrivalsPage> createState() => _TmbArrivalsPageState();
}

class _TmbArrivalsPageState extends State<TmbArrivalsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<TmbProvider>().loadArrivalsByLineAndStop(
            widget.lineCode,
            widget.stopCode,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = context.watch<TmbProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Temps de pas ${widget.stopCode}'),
      ),
      body: Builder(
        builder: (_) {
          if (p.isLoadingArrivals) {
            return const Center(child: CircularProgressIndicator());
          }

          if (p.error != null) {
            return Center(child: Text('Error: ${p.error}'));
          }

          if (p.arrivals.isEmpty) {
            return Center(
              child: Text(
                'No hi ha arribades per a la línia ${widget.lineCode} a la parada ${widget.stopCode}.',
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Línia: ${widget.lineCode}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Parada: ${widget.stopCode}'),
                    Text('Nom: ${widget.stopName}'),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.separated(
                  itemCount: p.arrivals.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, i) {
                    final item = p.arrivals[i];
                    return ListTile(
                      title: Text('Línia ${item.line}'),
                      subtitle: Text(item.destination),
                      trailing: Text('${item.minutes} min'),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
