import 'package:flutter/material.dart';

class BasicScaffoldPage extends StatefulWidget {
  const BasicScaffoldPage({super.key});

  @override
  State<BasicScaffoldPage> createState() => _BasicScaffoldPageState();
}

class _BasicScaffoldPageState extends State<BasicScaffoldPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endFloat;

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.endFloat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기본 Scaffold'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Scaffold는 앱의 기본 레이아웃 구조를 제공하는 위젯입니다.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            5,
            (index) => ListTile(
              title: Text('목록 아이템 ${index + 1}'),
              subtitle: const Text('Scaffold body 예시 아이템'),
              leading: Icon(Icons.star, color: Colors.amber[700]),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 20),
          const Text('FAB 위치 설정:'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: const Text('endFloat'),
                selected: _fabLocation == FloatingActionButtonLocation.endFloat,
                onSelected: (selected) {
                  if (selected) {
                    _onFabLocationChanged(FloatingActionButtonLocation.endFloat);
                  }
                },
              ),
              ChoiceChip(
                label: const Text('centerFloat'),
                selected:
                    _fabLocation == FloatingActionButtonLocation.centerFloat,
                onSelected: (selected) {
                  if (selected) {
                    _onFabLocationChanged(
                        FloatingActionButtonLocation.centerFloat);
                  }
                },
              ),
              ChoiceChip(
                label: const Text('endDocked'),
                selected: _fabLocation == FloatingActionButtonLocation.endDocked,
                onSelected: (selected) {
                  if (selected) {
                    _onFabLocationChanged(FloatingActionButtonLocation.endDocked);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text('FAB 표시'),
            value: _showFab,
            onChanged: (bool value) {
              setState(() {
                _showFab = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Bottom Bar Notch 표시'),
            value: _showNotch,
            onChanged: (bool value) {
              setState(() {
                _showNotch = value;
              });
            },
          ),
        ],
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('FAB 클릭!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _BottomAppBarWidget(
        showNotch: _showNotch,
        fabLocation: _fabLocation,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomAppBarWidget extends StatelessWidget {
  const _BottomAppBarWidget({
    required this.showNotch,
    required this.fabLocation,
  });

  final bool showNotch;
  final FloatingActionButtonLocation fabLocation;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: showNotch ? const CircularNotchedRectangle() : null,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: [
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            if (fabLocation == FloatingActionButtonLocation.centerDocked) ...[
              const Spacer(),
            ],
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
