import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xff2c3e50),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircularProgressIndicator(),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text(
                  'инициализация...',
                  style: TextStyle(color: Color(0xffe9ebec)),
                ))
          ],
        )
      ]),
    ));
  }
}
