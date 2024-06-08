import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/player_provider.dart';
import '../models/player.dart';
import 'game_screen.dart';

class PlayersScreen extends StatefulWidget {
  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  Player? _selectedOpponent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Players'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/bet');
            },
          ),
        ],
      ),
      body: Consumer<PlayerProvider>(
        builder: (context, playerProvider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: playerProvider.players.length,
                  itemBuilder: (context, index) {
                    final player = playerProvider.players[index];
                    return ListTile(
                      title: Text(player.username),
                      subtitle: Text('Points: ${player.points}'),
                      selected: _selectedOpponent == player,
                      onTap: () {
                        setState(() {
                          _selectedOpponent = player;
                        });
                      },
                    );
                  },
                ),
              ),
              if (_selectedOpponent != null) ...[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameScreen(opponent: _selectedOpponent!),
                      ),
                    );
                  },
                  child: Text('Play against ${_selectedOpponent!.username}'),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
