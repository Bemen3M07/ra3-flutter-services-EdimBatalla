import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hello_world/core/service/car_http_service.dart';

void main() {
  test('getCars retorna dades', () async {
    final service = CarHttpService();
    final cars = await service.getCars();

    expect(cars, isNotEmpty);
    expect(cars.first.make, isNotEmpty);
    expect(cars.first.model, isNotEmpty);
  });
}
