import 'dart:async';

import 'package:flutter/material.dart';
import 'screens/ui_widgets_page.dart';
import 'screens/functional_widgets_page.dart';

void main() {
  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    print(error);
    print(stack);
  },) ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Study'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UIWidgetsPage()),
                );
              },
              child: const Text('UI 위젯 학습'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FunctionalWidgetsPage()),
                );
              },
              child: const Text('기능 위젯 학습'),
            ),
          ],
        ),
      ),
    );
  }
}
