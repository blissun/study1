import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  final _random = math.Random();

  void _changeShape() {
    setState(() {
      _width = _random.nextInt(200).toDouble() + 50;
      _height = _random.nextInt(200).toDouble() + 50;
      _color = Color.fromRGBO(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        1,
      );
      _borderRadius = BorderRadius.circular(_random.nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer 위젯'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AnimatedContainer 위젯의 특징:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('• 암시적 애니메이션을 지원하는 Container'),
                    Text('• 크기, 색상, 위치 등의 자동 애니메이션'),
                    Text('• duration으로 애니메이션 시간 설정'),
                    Text('• curve로 애니메이션 곡선 설정'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    width: _width,
                    height: _height,
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: _borderRadius,
                    ),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _changeShape,
                    child: const Text('모양 변경하기'),
                  ),
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '버튼을 누를 때마다 컨테이너의 크기, 색상, 모서리가 애니메이션과 함께 변경됩니다.',
                      textAlign: TextAlign.center,
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
