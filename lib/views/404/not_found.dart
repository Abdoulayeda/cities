import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page not found!"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text('oops, page not found'),
      ),
    );
  }
}
