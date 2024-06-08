import 'package:flutter/material.dart';
import '../models/player.dart';
import '../services/api_service.dart';

class PlayerProvider with ChangeNotifier {
  List<Player> _players = [];
  Player? _currentPlayer;

  List<Player> get players => _players;
  Player? get currentPlayer => _currentPlayer;

  void registerPlayer(String username) {
    _currentPlayer = Player(username: username, points: 1000);
    _players.add(_currentPlayer!);
    notifyListeners();
  }

  void placeBet(int value, int number, String choice) {
    // Lógica para fazer a aposta
    if (_currentPlayer != null) {
      _currentPlayer!.points -= value;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>?> playGame(String username1, String username2) async {
    try {
      return await ApiService().playGame(username1, username2);
    } catch (e) {
      // Handle any exceptions from the API call
      print('Error: ${e.toString()}');
      return null;
    }
  }
}
