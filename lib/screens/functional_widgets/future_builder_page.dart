import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({super.key});

  Future<List<String>> _fetchData() async {
    // 데이터를 가져오는 것을 시뮬레이션
    await Future.delayed(const Duration(seconds: 2));
    return [
      '데이터 1',
      '데이터 2',
      '데이터 3',
      '데이터 4',
      '데이터 5',
    ];
  }

  Future<String> _fetchDetailData(int index) async {
    await Future.delayed(const Duration(seconds: 1));
    return '데이터 $index의 상세 정보입니다.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder 위젯'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FutureBuilder 기본 예제:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<String>>(
                future: _fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('데이터가 없습니다.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data![index]),
                          subtitle: FutureBuilder<String>(
                            future: _fetchDetailData(index + 1),
                            builder: (context, detailSnapshot) {
                              if (detailSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text('상세 정보 로딩 중...');
                              }
                              return Text(
                                detailSnapshot.data ?? '상세 정보 없음',
                              );
                            },
                          ),
                        ),
                      );
                    },
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
