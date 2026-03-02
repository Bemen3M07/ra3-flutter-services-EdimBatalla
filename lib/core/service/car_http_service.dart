import 'package:http/http.dart' as http;
import 'package:flutter_hello_world/core/entity/car_model.dart';

class CarHttpService {
  final String _serverUrl = 'https://car-data.p.rapidapi.com';
  final String _headerKey =
      '5f332ffdd7mshfe46460c001d803p17052ejsn87212c3c1d7c';
  final String _headerHost = 'car-data.p.rapidapi.com';

  Future<List<CarModel>> getCars() async {
    final uri = Uri.parse('$_serverUrl/cars');

    final response = await http.get(
      uri,
      headers: {
        'x-rapidapi-key': _headerKey,
        'x-rapidapi-host': _headerHost,
      },
    );

    if (response.statusCode == 200) {
      return carModelFromJson(response.body);
    }
    throw Exception('Error getCars: ${response.statusCode} ${response.body}');
  }
}
