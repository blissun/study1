import 'package:flutter/material.dart';

class TextWidgetPage extends StatelessWidget {
  const TextWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gap20 = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text 위젯'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('기본 텍스트:'),
            gap20,
            const Text(
              '기본 스타일의 텍스트입니다.',
            ),
            gap20,
            const Text('크기가 다른 텍스트:'),
            gap20,
            const Text(
              '큰 텍스트 (size: 24)',
              style: TextStyle(fontSize: 24),
            ),
            gap20,
            const Text(
              '작은 텍스트 (size: 12)',
              style: TextStyle(fontSize: 12),
            ),
            gap20,
            const Text('글꼴 두께:'),
            gap20,
            const Text(
              '보통 텍스트 (normal)',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            gap20,
            const Text(
              '굵은 텍스트 (bold)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            gap20,
            const Text('텍스트 정렬:'),
            gap20,
            const Text(
              '왼쪽 정렬 텍스트\n여러 줄의 텍스트를\n왼쪽으로 정렬합니다.',
              textAlign: TextAlign.left,
            ),
            gap20,
            const Text(
              '가운데 정렬 텍스트\n여러 줄의 텍스트를\n가운데로 정렬합니다.',
              textAlign: TextAlign.center,
            ),
            gap20,
            const Text(
              '오른쪽 정렬 텍스트\n여러 줄의 텍스트를\n오른쪽으로 정렬합니다.',
              textAlign: TextAlign.right,
            ),
            gap20,
            const Text('오버플로우 처리:'),
            gap20,
            Container(
              width: 150,
              color: Colors.grey[200],
              child: const Text(
                '긴 텍스트가 있을 때 오버플로우를 처리하는 방법입니다.',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            gap20,
            Container(
              width: 150,
              color: Colors.grey[200],
              child: const Text(
                '긴 텍스트가 있을 때 오버플로우를 처리하는 방법입니다.',
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
