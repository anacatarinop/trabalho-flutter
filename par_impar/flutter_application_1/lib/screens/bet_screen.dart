import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/player_provider.dart';

class BetScreen extends StatefulWidget {
  @override
  _BetScreenState createState() => _BetScreenState();
}

class _BetScreenState extends State<BetScreen> {
  final TextEditingController _betController = TextEditingController();
  int? _selectedNumber;
  String? _selectedChoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Place Bet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _betController,
              decoration: InputDecoration(labelText: 'Enter bet amount'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<int>(
              hint: Text('Select a number (1-5)'),
              value: _selectedNumber,
              items: [1, 2, 3, 4, 5].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedNumber = value;
                });
              },
            ),
            DropdownButton<String>(
              hint: Text('Select Par or Impar'),
              value: _selectedChoice,
              items: ['Par', 'Impar'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedChoice = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedNumber != null && _selectedChoice != null) {
                  Provider.of<PlayerProvider>(context, listen: false).placeBet(
                    int.parse(_betController.text),
                    _selectedNumber!,
                    _selectedChoice!,
                  );
                  Navigator.pushNamed(context, '/players');
                }
              },
              child: Text('Place Bet'),
            ),
          ],
        ),
      ),
    );
  }
}
