import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hello_world/core/provider/car_provider.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({super.key});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<CarProvider>().loadCars());
  }

  @override
  Widget build(BuildContext context) {
    final p = context.watch<CarProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cars')),
      body: Builder(
        builder: (_) {
          if (p.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (p.error != null) {
            return Center(child: Text('Error: ${p.error}'));
          }
          return RefreshIndicator(
            onRefresh: p.loadCars,
            child: ListView.separated(
              itemCount: p.cars.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) {
                final car = p.cars[i];
                return ListTile(
                  title: Text('${car.make} ${car.model}'),
                  subtitle: Text('Year: ${car.year}  •  ID: ${car.id}'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
