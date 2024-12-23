import 'package:flutter/material.dart';

class IndexedStackNavigationPage extends StatefulWidget {
  const IndexedStackNavigationPage({super.key});

  @override
  State<IndexedStackNavigationPage> createState() =>
      _IndexedStackNavigationPageState();
}

class _IndexedStackNavigationPageState extends State<IndexedStackNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexedStack Navigation'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 50),
          SizedBox(height: 16),
          Text(
            'Home Screen',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          Text(
            'IndexedStack은 모든 화면을 메모리에 유지하면서\n현재 선택된 화면만 보여줍니다.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 50),
          SizedBox(height: 16),
          Text(
            'Search Screen',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          Text(
            '화면을 전환해도 상태가 유지됩니다.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 50),
          SizedBox(height: 16),
          Text(
            'Settings Screen',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          Text(
            '메모리 사용량이 증가하지만\n화면 전환이 매우 빠릅니다.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
