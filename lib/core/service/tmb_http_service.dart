import 'dart:convert';
import 'package:flutter_hello_world/core/entity/tmb_bus_line_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_hello_world/core/entity/tmb_arrival_model.dart';
import 'package:flutter_hello_world/core/entity/tmb_stop_model.dart';

class TmbHttpService {
  final String _baseUrl = 'https://api.tmb.cat';
  final String _appId = '8e899221';
  final String _appKey = '7cfd708a1de00494f43dd3593bb02328';

  Uri _buildUri(String path) {
    return Uri.parse('$_baseUrl$path').replace(
      queryParameters: {
        'app_id': _appId,
        'app_key': _appKey,
      },
    );
  }

  Future<List<TmbBusLineModel>> getBusLines() async {
    final response = await http.get(
      _buildUri('/v1/transit/linies/bus'),
    );

    if (response.statusCode != 200) {
      throw Exception('Error getBusLines: ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);
    final List<dynamic> list = _extractList(decoded);

    return list
        .map((e) => TmbBusLineModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<TmbStopModel>> getStopsByLine(String lineCode) async {
    final response = await http.get(
      _buildUri('/v1/transit/linies/bus/$lineCode/parades'),
    );

    if (response.statusCode != 200) {
      throw Exception('Error getStopsByLine: ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);
    final List<dynamic> list = _extractList(decoded);

    return list
        .map((e) => TmbStopModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<TmbArrivalModel>> getArrivalsByLineAndStop(
    String lineCode,
    String stopCode,
  ) async {
    final response = await http.get(
      _buildUri('/v1/ibus/lines/$lineCode/stops/$stopCode'),
    );

    if (response.statusCode != 200) {
      throw Exception('Error getArrivals: ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);
    final List<dynamic> list = _extractList(decoded);

    return list
        .map((e) => TmbArrivalModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  List<dynamic> _extractList(dynamic decoded) {
    if (decoded is List) return decoded;

    if (decoded is Map<String, dynamic>) {
      for (final key in [
        'features',
        'data',
        'items',
        'results',
        'parades',
        'linies',
      ]) {
        final value = decoded[key];
        if (value is List) return value;
      }

      if (decoded['feature'] is Map<String, dynamic>) {
        return [decoded['feature']];
      }
    }

    return [];
  }
}
