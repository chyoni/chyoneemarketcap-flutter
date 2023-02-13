import 'package:flutter/material.dart';

class PortfoliosScreen extends StatelessWidget {
  const PortfoliosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Portfolios")),
      body: Container(
        child: const Center(
          child: Text("Portfolios"),
        ),
      ),
    );
  }
}
