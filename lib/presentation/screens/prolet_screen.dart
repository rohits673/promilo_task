import 'package:flutter/material.dart';

class ProletScreen extends StatelessWidget {
  const ProletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prolet'),
      ),
      body: const Center(
        child: Text('Prolet Screen'),
      ),
    );
  }
}
