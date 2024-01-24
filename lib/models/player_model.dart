class Player {
  final int? id;
  final String? name;
  final String? position;
  final DateTime? dateOfBirth;
  final String? countryOfBirth;
  final String? nationality;
  final int? shirtNumber;
  final String? role;

  Player({
    this.id,
    this.name,
    this.position,
    this.dateOfBirth,
    this.countryOfBirth,
    this.nationality,
    this.shirtNumber,
    this.role,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        countryOfBirth: json["countryOfBirth"],
        nationality: json["nationality"],
        shirtNumber: json["shirtNumber"],
        role: json["role"]!,
      );

//metodo necesario para poder postear un usuario
  Map<String, dynamic> toMap() =>
      {"name": name, "number": shirtNumber, "position": position};
}
