import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              const FlutterLogo(),
              const Expanded(
                  child: Text( "Flutter's hot reload helps you quickly and easily experiment, build UIs, add"
                      "features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators"
                      "and hardware for IOS and Android"
                  )
              ),
              const Icon(Icons.sentiment_satisfied)
            ],
          ),
        ),
      ),
    ),
  );
}
