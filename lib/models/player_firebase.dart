class PlayerFirebase {
  final int? id;
  final String? name;

  PlayerFirebase({
    this.id,
    this.name,
  });

  factory PlayerFirebase.fromJson(Map<String, dynamic> json) => PlayerFirebase(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
