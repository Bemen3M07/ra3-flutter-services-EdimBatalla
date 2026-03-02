import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_hello_world/core/entity/joke_model.dart';
import 'package:flutter_hello_world/core/service/joke_http_servide.dart';

class JokeProvider extends ChangeNotifier {
  final JokeHttpService _service;
  final _rng = Random();

  JokeProvider(this._service);

  bool isLoading = false;
  String? error;
  JokeModel? current;

  Future<void> loadRandomJoke() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      // Requisit: cada cop que premem el botó, tornem a cridar el servei
      final jokes = await _service.getGoodJokes();
      if (jokes.isEmpty) {
        throw Exception('La llista d’acudits està buida');
      }
      current = jokes[_rng.nextInt(jokes.length)];
    } catch (e) {
      error = e.toString();
      current = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
