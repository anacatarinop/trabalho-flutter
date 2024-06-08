import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/player_provider.dart';
import '../models/player.dart';
import 'result_screen.dart';

class GameScreen extends StatefulWidget {
  final Player opponent;

  GameScreen({required this.opponent});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    String username = Provider.of<PlayerProvider>(context, listen: false).currentPlayer!.username;

    return Scaffold(
      appBar: AppBar(title: Text('Play against ${widget.opponent.username}')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              var result = await Provider.of<PlayerProvider>(context, listen: false)
                  .playGame(username, widget.opponent.username);
              if (result != null && result['vencedor'] != null && result['perdedor'] != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: result),
                  ),
                );
              } else {
                // Handle null result or unexpected data structure
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to get game result.')),
                );
              }
            } catch (e) {
              // Handle any exceptions from the API call
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${e.toString()}')),
              );
            }
          },
          child: Text('Play'),
        ),
      ),
    );
  }
}
