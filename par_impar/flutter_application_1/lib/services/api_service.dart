import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/player.dart';

class ApiService {
  static const String baseUrl = 'https://par-impar.glitch.me';

  Future<List<Player>> fetchPlayers() async {
    final response = await http.get(Uri.parse('$baseUrl/jogadores'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['jogadores'];
      return data.map((json) => Player.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load players');
    }
  }

  Future<void> registerPlayer(String username) async {
    final response = await http.post(
      Uri.parse('$baseUrl/novo'),
      body: jsonEncode({'username': username}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to register player');
    }
  }

  Future<void> placeBet(String username, int value, int number, String choice) async {
    final response = await http.post(
      Uri.parse('$baseUrl/aposta'),
      body: jsonEncode({
        'username': username,
        'valor': value,
        'numero': number,
        'parimpar': choice == 'Par' ? 2 : 1,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to place bet');
    }
  }

  Future<Map<String, dynamic>> playGame(String username1, String username2) async {
    final response = await http.get(Uri.parse('$baseUrl/jogar/$username1/$username2'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to play game');
    }
  }

  Future<int> fetchPoints(String username) async {
    final response = await http.get(Uri.parse('$baseUrl/pontos/$username'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['pontos'];
    } else {
      throw Exception('Failed to fetch points');
    }
  }
}
