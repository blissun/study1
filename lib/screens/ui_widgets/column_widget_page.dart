import 'package:flutter/material.dart';

class ColumnWidgetPage extends StatelessWidget {
  const ColumnWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gap10 = SizedBox(height: 10);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Column 위젯'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('CrossAxisAlignment.start:'),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: Colors.amber.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 100, height: 30, color: Colors.red),
                  gap10,
                  Container(width: 80, height: 30, color: Colors.green),
                  gap10,
                  Container(width: 60, height: 30, color: Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('CrossAxisAlignment.center:'),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: Colors.amber.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: 100, height: 30, color: Colors.red),
                  gap10,
                  Container(width: 80, height: 30, color: Colors.green),
                  gap10,
                  Container(width: 60, height: 30, color: Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('CrossAxisAlignment.end:'),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: Colors.amber.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(width: 100, height: 30, color: Colors.red),
                  gap10,
                  Container(width: 80, height: 30, color: Colors.green),
                  gap10,
                  Container(width: 60, height: 30, color: Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('CrossAxisAlignment.stretch:'),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: Colors.amber.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(height: 30, color: Colors.red),
                  gap10,
                  Container(height: 30, color: Colors.green),
                  gap10,
                  Container(height: 30, color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
