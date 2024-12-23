import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  const GestureDetectorPage({super.key});

  @override
  State<GestureDetectorPage> createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  Color _boxColor = Colors.blue;
  double _boxSize = 100.0;

  void _changeColor() {
    setState(() {
      _boxColor = _boxColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  void _updateSize(bool increase) {
    setState(() {
      _boxSize += increase ? 20 : -20;
      if (_boxSize < 50) _boxSize = 50;
      if (_boxSize > 200) _boxSize = 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector 위젯'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('탭하여 색상 변경:'),
            const Spacer(flex: 1),
            GestureDetector(
              onTap: _changeColor,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _boxSize,
                height: _boxSize,
                color: _boxColor,
                child: const Center(
                  child: Text(
                    'Tap me!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2),
            const Text('더블 탭으로 크기 증가/감소:'),
            const Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onDoubleTap: () => _updateSize(false),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text('Double tap to decrease'),
                  ),
                ),
                const Spacer(flex: 1),
                GestureDetector(
                  onDoubleTap: () => _updateSize(true),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text('Double tap to increase'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
