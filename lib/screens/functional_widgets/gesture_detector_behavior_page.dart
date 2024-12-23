import 'package:flutter/material.dart';

class GestureDetectorBehaviorPage extends StatefulWidget {
  const GestureDetectorBehaviorPage({super.key});

  @override
  State<GestureDetectorBehaviorPage> createState() =>
      _GestureDetectorBehaviorPageState();
}

class _GestureDetectorBehaviorPageState extends State<GestureDetectorBehaviorPage> {
  HitTestBehavior _behavior = HitTestBehavior.deferToChild;
  String _message = '터치해보세요';
  Color _containerColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector Behavior'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            GestureDetector(
              behavior: _behavior,
              onTapDown: (details) {
                setState(() {
                  _message = '터치 감지!';
                  _containerColor = Colors.red;
                });
              },
              onTapUp: (details) {
                setState(() {
                  _message = '터치 종료';
                  _containerColor = Colors.blue;
                });
              },
              child: Container(
                width: 200,
                height: 200,
                color: _containerColor,
                alignment: Alignment.center,
                child: const Text(
                  '터치 영역',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<HitTestBehavior>(
              value: _behavior,
              items: HitTestBehavior.values
                  .map((behavior) => DropdownMenuItem(
                        value: behavior,
                        child: Text(behavior.toString().split('.').last),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _behavior = value;
                    _message = '터치해보세요';
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _getBehaviorDescription(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getBehaviorDescription() {
    switch (_behavior) {
      case HitTestBehavior.deferToChild:
        return 'deferToChild: 자식 위젯이 히트 테스트에 반응할 수 있는 경우에만 이벤트를 처리합니다.';
      case HitTestBehavior.opaque:
        return 'opaque: 이벤트를 가로채고 자식 위젯으로 전파하지 않습니다.';
      case HitTestBehavior.translucent:
        return 'translucent: 이벤트를 처리하고 자식 위젯에게도 전달합니다.';
    }
  }
}
