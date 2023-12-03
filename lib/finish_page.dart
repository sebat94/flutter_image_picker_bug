import 'package:flutter/material.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'input file bug detected!',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
