import 'package:flutter/foundation.dart';
import 'package:flutter_hello_world/core/entity/car_model.dart';
import 'package:flutter_hello_world/core/service/car_http_service.dart';

class CarProvider extends ChangeNotifier {
  final CarHttpService _service;

  CarProvider(this._service);

  bool isLoading = false;
  String? error;
  List<CarModel> cars = [];

  Future<void> loadCars() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      cars = await _service.getCars();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
