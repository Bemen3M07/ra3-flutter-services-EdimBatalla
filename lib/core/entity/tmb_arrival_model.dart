class TmbArrivalModel {
  final String line;
  final String destination;
  final String minutes;

  TmbArrivalModel({
    required this.line,
    required this.destination,
    required this.minutes,
  });

  factory TmbArrivalModel.fromMap(Map<String, dynamic> map) {
    final props = (map['properties'] as Map<String, dynamic>?) ?? map;

    return TmbArrivalModel(
      line: (props['line'] ?? props['linia'] ?? props['routeId'] ?? '')
          .toString(),
      destination:
          (props['destination'] ?? props['desti'] ?? props['text_ca'] ?? '')
              .toString(),
      minutes: (props['t-in-min'] ?? props['minutes'] ?? props['time'] ?? '')
          .toString(),
    );
  }
}
