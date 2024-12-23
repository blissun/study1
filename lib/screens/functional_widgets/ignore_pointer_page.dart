import 'package:flutter/material.dart';

class IgnorePointerPage extends StatefulWidget {
  const IgnorePointerPage({super.key});

  @override
  State<IgnorePointerPage> createState() => _IgnorePointerPageState();
}

class _IgnorePointerPageState extends State<IgnorePointerPage> {
  bool _ignoring = false;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IgnorePointer Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'IgnorePointer 상태:',
              style: TextStyle(fontSize: 20),
            ),
            Switch(
              value: _ignoring,
              onChanged: (bool value) {
                setState(() {
                  _ignoring = value;
                });
              },
            ),
            const SizedBox(height: 20),
            IgnorePointer(
              ignoring: _ignoring,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: _ignoring ? Colors.grey : Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '카운터: $_counter',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _counter++;
                            });
                          },
                          child: const Text('증가'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _ignoring
                        ? '현재 모든 터치 이벤트가 무시됩니다'
                        : '버튼을 눌러보세요',
                    style: TextStyle(
                      color: _ignoring ? Colors.red : Colors.green,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'IgnorePointer 위젯은 자식 위젯의 모든 터치 이벤트를 무시할 수 있게 해줍니다. '
                '이는 특정 상황에서 사용자 입력을 일시적으로 비활성화하고 싶을 때 유용합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
