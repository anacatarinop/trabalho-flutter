class Player {
  final String username;
  int points;

  Player({required this.username, required this.points});

  // Método para criar uma instância de Player a partir de um JSON
  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      username: json['username'],
      points: json['pontos'],
    );
  }

  // Método para converter uma instância de Player para JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'pontos': points,
    };
  }
}
