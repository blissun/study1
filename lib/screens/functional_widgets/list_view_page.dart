import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView 위젯'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ListView 위젯의 특징:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('• 스크롤 가능한 목록을 만드는 위젯'),
                    Text('• ListView.builder: 필요할 때만 아이템을 생성'),
                    Text('• ListView.separated: 아이템 사이에 구분자 추가'),
                    Text('• 수직/수평 스크롤 모두 지원'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        '항목 ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('ListView.builder:'),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Colors.primaries[index % Colors.primaries.length],
                        child: Text('${index + 1}'),
                      ),
                      title: Text('리스트 아이템 ${index + 1}'),
                      subtitle: Text('리스트 아이템 설명 ${index + 1}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('아이템 ${index + 1} 선택됨'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
