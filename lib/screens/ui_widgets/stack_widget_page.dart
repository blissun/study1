import 'package:flutter/material.dart';

class StackWidgetPage extends StatelessWidget {
  const StackWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack 위젯'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('기본 Stack:'),
            const Spacer(flex: 1),
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              ],
            ),
            const Spacer(flex: 2),
            const Text('Positioned Stack:'),
            const Spacer(flex: 1),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned.fill(
                    child: ColoredBox(
                      color: Colors.amberAccent,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.purple,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.orange,
                    ),
                  ),
                  const Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Positioned Text',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
