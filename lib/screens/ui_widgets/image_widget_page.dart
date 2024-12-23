import 'package:flutter/material.dart';

class ImageWidgetPage extends StatelessWidget {
  const ImageWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wideImageUrl = 'https://picsum.photos/200/50';
    final squareImageUrl = 'https://picsum.photos/150';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image 위젯'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('네트워크 이미지:'),
            const SizedBox(height: 10),
            Image.network(
              wideImageUrl,
              width: double.infinity,
              // height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text('이미지 피팅:'),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Image.network(
                          wideImageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text('contain'),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Image.network(
                          wideImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text('cover'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('원형 이미지1:'),
            const SizedBox(height: 10),
            Center(
              child: ClipOval(
                child: Image.network(
                  squareImageUrl,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text('원형 이미지2:'),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(squareImageUrl),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
