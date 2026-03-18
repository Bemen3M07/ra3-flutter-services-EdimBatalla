class TmbStopModel {
  final String code;
  final String name;

  TmbStopModel({
    required this.code,
    required this.name,
  });

  factory TmbStopModel.fromMap(Map<String, dynamic> map) {
    final props = (map['properties'] as Map<String, dynamic>?) ?? map;

    return TmbStopModel(
      code: (props['CODI_PARADA'] ?? props['id'] ?? props['code'] ?? '')
          .toString(),
      name: (props['NOM_PARADA'] ?? props['name'] ?? props['DESCRIPCIO'] ?? '')
          .toString(),
    );
  }
}
