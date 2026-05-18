import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talkyu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Talkyu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Talkyu"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Masukin aku plisss",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 6,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Masukin lagi plisss",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}