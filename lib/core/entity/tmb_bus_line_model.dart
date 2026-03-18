class TmbBusLineModel {
  final String code;
  final String name;

  TmbBusLineModel({
    required this.code,
    required this.name,
  });

  factory TmbBusLineModel.fromMap(Map<String, dynamic> map) {
    final props = (map['properties'] as Map<String, dynamic>?) ?? map;

    return TmbBusLineModel(
      code: (props['CODI_LINIA'] ?? props['id'] ?? props['line'] ?? '')
          .toString(),
      name: (props['NOM_LINIA'] ?? props['name'] ?? props['desc'] ?? '')
          .toString(),
    );
  }
}
