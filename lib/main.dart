import 'package:flutter/material.dart';
import 'package:flutter_hello_world/core/provider/tmb_provider.dart';
import 'package:flutter_hello_world/core/service/joke_http_servide.dart';
import 'package:flutter_hello_world/core/service/tmb_http_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hello_world/core/provider/car_provider.dart';
import 'package:flutter_hello_world/core/service/car_http_service.dart';
import 'package:flutter_hello_world/core/provider/joke_provider.dart';
import 'package:flutter_hello_world/ui/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarProvider(CarHttpService())),
        ChangeNotifierProvider(create: (_) => JokeProvider(JokeHttpService())),
        ChangeNotifierProvider(create: (_) => TmbProvider(TmbHttpService())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Services App',
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
