import 'package:flutter/material.dart';
import 'package:music_player/home.dart';
import 'package:music_player/music.dart';
import 'package:music_player/musicpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}