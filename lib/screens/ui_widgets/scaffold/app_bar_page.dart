import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('AppBar 예제'),
              background: Image.network(
                'https://picsum.photos/800/600',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AppBar 설정',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SwitchListTile(
                    title: const Text('Pinned'),
                    subtitle: const Text('스크롤 시 AppBar 고정'),
                    value: _pinned,
                    onChanged: (bool value) {
                      setState(() {
                        _pinned = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Snap'),
                    subtitle: const Text('스크롤 시 AppBar 스냅'),
                    value: _snap,
                    onChanged: (bool value) {
                      setState(() {
                        _snap = value;
                        _floating = _floating || value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Floating'),
                    subtitle: const Text('스크롤 시 AppBar 플로팅'),
                    value: _floating,
                    onChanged: (bool value) {
                      setState(() {
                        _floating = value;
                        _snap = _snap && value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('AppBar 설정을 변경해보세요'),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _pinned = true;
                        _snap = false;
                        _floating = false;
                      });
                    },
                    child: const Text('초기화'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
