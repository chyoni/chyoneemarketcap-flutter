import 'package:flutter/material.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Communities")),
      body: Container(
        child: const Center(
          child: Text("Communities"),
        ),
      ),
    );
  }
}
