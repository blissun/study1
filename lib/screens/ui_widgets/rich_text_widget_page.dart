import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextWidgetPage extends StatelessWidget {
  const RichTextWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gap20 = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RichText 위젯'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('기본 Text.rich 예제:'),
            gap20,
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: '기본 텍스트에 ',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextSpan(
                    text: '색상',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: '과 ',
                    style: TextStyle(fontSize: 16),
                  ),
                  const TextSpan(
                    text: '밑줄',
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.wavy,
                      decorationColor: Colors.red,
                    ),
                  ),
                  const TextSpan(
                    text: '을 적용할 수 있습니다.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            gap20,
            const Text('중첩된 TextSpan 예제:'),
            gap20,
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: '중첩된 '),
                  TextSpan(
                    text: 'TextSpan',
                    style: TextStyle(
                      color: Colors.purple[400],
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '으로 ',
                        style: TextStyle(
                          color: Colors.orange[400],
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const TextSpan(
                        text: '다양한 스타일',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const TextSpan(text: '을 적용할 수 있습니다.'),
                ],
              ),
            ),
            gap20,
            const Text('링크 스타일 텍스트:'),
            gap20,
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: '이것은 '),
                  TextSpan(
                    text: '클릭 가능한 링크',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('링크가 클릭되었습니다!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                  ),
                  const TextSpan(text: ' 입니다.'),
                ],
              ),
            ),
            gap20,
            const Text('이모지와 특수 문자:'),
            gap20,
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '이모지 😊 와 '),
                  TextSpan(
                    text: '특수 문자 ★',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.amber,
                    ),
                  ),
                  TextSpan(text: '를 사용할 수 있습니다 ✨'),
                ],
              ),
            ),
            gap20,
            const Text('다양한 텍스트 스타일:'),
            gap20,
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: '기본 텍스트, '),
                  const TextSpan(
                    text: '굵은 텍스트, ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: '기울임꼴, ',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: '그림자, ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple[400],
                      shadows: [
                        Shadow(
                          color: Colors.purple.withOpacity(0.3),
                          offset: const Offset(2, 2),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                  const TextSpan(
                    text: '취소선',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 2,
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
