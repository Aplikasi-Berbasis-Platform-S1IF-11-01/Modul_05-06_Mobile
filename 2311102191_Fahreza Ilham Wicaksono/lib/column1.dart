import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("Deliver features faster"),
              Text("Craft beautiful UI's"),
              Expanded(
                child: FittedBox(fit: BoxFit.contain, child: FlutterLogo()),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
