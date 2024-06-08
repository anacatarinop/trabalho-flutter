import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/player_provider.dart';
import 'screens/register_screen.dart';
import 'screens/bet_screen.dart';
import 'screens/players_screen.dart';
import 'screens/game_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlayerProvider(),
      child: MaterialApp(
        title: 'Par ou Ímpar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => RegisterScreen(),
          '/bet': (context) => BetScreen(),
          '/players': (context) => PlayersScreen(),
        },
      ),
    );
  }
}
