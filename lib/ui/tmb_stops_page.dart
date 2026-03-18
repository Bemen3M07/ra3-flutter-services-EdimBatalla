import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hello_world/core/provider/tmb_provider.dart';
import 'package:flutter_hello_world/ui/tmb_arrivals_page.dart';

class TmbStopsPage extends StatefulWidget {
  final String lineCode;
  final String lineName;

  const TmbStopsPage({
    super.key,
    required this.lineCode,
    required this.lineName,
  });

  @override
  State<TmbStopsPage> createState() => _TmbStopsPageState();
}

class _TmbStopsPageState extends State<TmbStopsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<TmbProvider>().loadStopsByLine(widget.lineCode),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = context.watch<TmbProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Parades línia ${widget.lineCode}'),
      ),
      body: Builder(
        builder: (_) {
          if (p.isLoadingStops) {
            return const Center(child: CircularProgressIndicator());
          }

          if (p.error != null) {
            return Center(child: Text('Error: ${p.error}'));
          }

          if (p.stops.isEmpty) {
            return const Center(
              child: Text('No s’han trobat parades per aquesta línia.'),
            );
          }

          return ListView.separated(
            itemCount: p.stops.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final stop = p.stops[i];
              return ListTile(
                title: Text(stop.name),
                subtitle: Text('Codi: ${stop.code}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TmbArrivalsPage(
                        lineCode: widget.lineCode,
                        stopCode: stop.code,
                        stopName: stop.name,
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
