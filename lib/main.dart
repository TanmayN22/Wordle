import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle_app/controller.dart';
import 'pages/homepage.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Controller())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordle',
      theme: ThemeData(),
      home: Homepage(),
    );
  }
}
