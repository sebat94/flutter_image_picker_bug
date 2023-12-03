import 'package:flutter/material.dart';
import 'package:flutter_image_picker_bug/image_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
      ),
      home: const ImagePage(),
    );
  }
}
