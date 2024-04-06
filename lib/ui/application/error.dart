import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(
            child: Container(
      color: const Color(0xffc2140a),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('системная ошибка')],
      ),
    )));
  }
}
