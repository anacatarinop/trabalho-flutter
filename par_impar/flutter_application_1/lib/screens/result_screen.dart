import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> result;

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    final winner = result['vencedor'];
    final loser = result['perdedor'];

    return Scaffold(
      appBar: AppBar(title: Text('Game Result')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Winner: ${winner['username']}'),
            Text('Winning number: ${winner['numero']}'),
            Text('Winning choice: ${winner['parimpar'] == 2 ? 'Par' : 'Impar'}'),
            SizedBox(height: 20),
            Text('Loser: ${loser['username']}'),
            Text('Losing number: ${loser['numero']}'),
            Text('Losing choice: ${loser['parimpar'] == 2 ? 'Par' : 'Impar'}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/players'));
              },
              child: Text('Back to Players'),
            ),
          ],
        ),
      ),
    );
  }
}
