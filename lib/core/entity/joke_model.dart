class JokeModel {
  final int? id;
  final String? type;
  final String? setup;
  final String? punchline;

  JokeModel({
    this.id,
    this.type,
    this.setup,
    this.punchline,
  });

  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      id: map['id'] as int?,
      type: map['type'] as String?,
      setup: map['setup'] as String?,
      punchline: map['punchline'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type,
        'setup': setup,
        'punchline': punchline,
      };
}
