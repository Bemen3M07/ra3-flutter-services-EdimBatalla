import 'dart:convert';

class CarModel {
  final int id;
  final int year;
  final String make;
  final String model;

  CarModel({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
  });

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: (map['id'] ?? 0) as int,
      year: (map['year'] ?? 0) as int,
      make: (map['make'] ?? '') as String,
      model: (map['model'] ?? '') as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'year': year,
      'make': make,
      'model': model,
    };
  }

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      CarModel.fromMap(json);
  Map<String, dynamic> toJson() => toMap();
}

// Helpers per convertir String JSON <-> Llista de CarModel
List<CarModel> carModelFromJson(String str) {
  final List<dynamic> decoded = jsonDecode(str);
  return decoded
      .map((e) => CarModel.fromMap(e as Map<String, dynamic>))
      .toList();
}

String carModelToJson(List<CarModel> data) {
  final list = data.map((e) => e.toMap()).toList();
  return jsonEncode(list);
}
