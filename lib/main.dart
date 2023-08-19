import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(
    MaterialApp(
        home: const InputPage(),
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xFF060817),
            primaryColor: const Color(0xFF060817))),
  );
}



class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      height: 200,
    );
  }
}
