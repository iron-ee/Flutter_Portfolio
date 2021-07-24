import 'package:flutter/material.dart';
import 'package:flutter_worldcup_app/pages/actor_page.dart';
import 'package:flutter_worldcup_app/pages/food_most_page.dart';
import 'package:flutter_worldcup_app/pages/home.dart';
import 'package:flutter_worldcup_app/pages/idol_page.dart';
import 'package:flutter_worldcup_app/pages/intro.dart';
import 'package:flutter_worldcup_app/pages/test.dart';
import 'package:flutter_worldcup_app/pages/trip_most_page.dart';
import 'package:flutter_worldcup_app/pages/trip_sty_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/intro',
      routes: {
        '/intro': (context) => Intro(),
        '/home': (context) => Home(),
        '/idol': (context) => IdolPage(),
        '/actor': (context) => ActorPage(),
        '/trip_most': (context) => TripMostPage(),
        '/trip_sty': (context) => TripStylePage(),
        '/food_most': (context) => FoodMostPage(),
        '/test': (context) => Test(),
      },
    );
  }
}
