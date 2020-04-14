import 'package:flutter/material.dart';
import 'package:football_manager/ui/teams.dart';

import 'ui/home_page.dart';
import 'ui/past_matches_page.dart';
import 'ui/results_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/fm': (context) => PastMatchesPage(),
        '/t': (context) => TeamsPage(),
        '/r': (context) => ResultsPage(),
      },
      initialRoute: '/',
    );
  }
}


