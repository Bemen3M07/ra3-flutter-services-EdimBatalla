import 'package:flutter/foundation.dart';
import 'package:flutter_hello_world/core/entity/tmb_arrival_model.dart';
import 'package:flutter_hello_world/core/entity/tmb_bus_line_model.dart';
import 'package:flutter_hello_world/core/entity/tmb_stop_model.dart';
import 'package:flutter_hello_world/core/service/tmb_http_service.dart';

class TmbProvider extends ChangeNotifier {
  final TmbHttpService _service;

  TmbProvider(this._service);

  bool isLoadingLines = false;
  bool isLoadingStops = false;
  bool isLoadingArrivals = false;

  String? error;

  List<TmbBusLineModel> lines = [];
  List<TmbStopModel> stops = [];
  List<TmbArrivalModel> arrivals = [];

  Future<void> loadLines() async {
    isLoadingLines = true;
    error = null;
    notifyListeners();

    try {
      lines = await _service.getBusLines();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoadingLines = false;
      notifyListeners();
    }
  }

  Future<void> loadStopsByLine(String lineCode) async {
    isLoadingStops = true;
    error = null;
    notifyListeners();

    try {
      stops = await _service.getStopsByLine(lineCode);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoadingStops = false;
      notifyListeners();
    }
  }

  Future<void> loadArrivalsByLineAndStop(
    String lineCode,
    String stopCode,
  ) async {
    isLoadingArrivals = true;
    error = null;
    notifyListeners();

    try {
      arrivals = await _service.getArrivalsByLineAndStop(lineCode, stopCode);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoadingArrivals = false;
      notifyListeners();
    }
  }
}
