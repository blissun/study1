import 'package:flutter/material.dart';

class RowWidgetPage extends StatelessWidget {
  const RowWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gap10 = SizedBox(width: 10);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row 위젯'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('MainAxisAlignment.start:'),
            const SizedBox(height: 10),
            Container(
              height: 50,
              color: Colors.amber.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(width: 50, height: 30, color: Colors.red),
                  gap10,
                  Container(width: 50, height: 30, color: Colors.green),
                  gap10,
                  Container(width: 50, height: 30, color: Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('MainAxisAlignment.center:'),
            const SizedBox(height: 10),
            Container(
              height: 50,
              color: Colors.amber.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 50, height: 30, color: Colors.red),
                  gap10,
                  Container(width: 50, height: 30, color: Colors.green),
                  gap10,
                  Container(width: 50, height: 30, color: Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('MainAxisAlignment.end:'),
            const SizedBox(height: 10),
            Container(
              height: 50,
              color: Colors.amber.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(width: 50, height: 30, color: Colors.red),
                  gap10,
                  Container(width: 50, height: 30, color: Colors.green),
                  gap10,
                  Container(width: 50, height: 30, color: Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('MainAxisAlignment.spaceBetween:'),
            const SizedBox(height: 10),
            Container(
              height: 50,
              color: Colors.amber.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 50, height: 30, color: Colors.red),
                  Container(width: 50, height: 30, color: Colors.green),
                  Container(width: 50, height: 30, color: Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('MainAxisAlignment.spaceEvenly:'),
            const SizedBox(height: 10),
            Container(
              height: 50,
              color: Colors.amber.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(width: 50, height: 30, color: Colors.red),
                  Container(width: 50, height: 30, color: Colors.green),
                  Container(width: 50, height: 30, color: Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('MainAxisAlignment.spaceAround:'),
            const SizedBox(height: 10),
            Container(
              height: 50,
              color: Colors.amber.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(width: 50, height: 30, color: Colors.red),
                  Container(width: 50, height: 30, color: Colors.green),
                  Container(width: 50, height: 30, color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
