import 'package:flutter/material.dart';
import 'scaffold/basic_scaffold_page.dart';
import 'scaffold/app_bar_page.dart';
import 'scaffold/navigation_scaffold_page.dart';

class ScaffoldWidgetPage extends StatelessWidget {
  const ScaffoldWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold 위젯'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            title: '기본 Scaffold',
            description: 'Scaffold의 기본 구조와 주요 속성들을 알아봅니다.',
            icon: Icons.view_agenda,
            page: const BasicScaffoldPage(),
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            title: 'AppBar 커스터마이징',
            description: 'AppBar의 다양한 기능과 스타일링을 살펴봅니다.',
            icon: Icons.web,
            page: const AppBarPage(),
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            title: '네비게이션 Scaffold',
            description: '네비게이션 기능이 포함된 Scaffold 구현 예제입니다.',
            icon: Icons.navigation,
            page: const NavigationScaffoldPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Widget page,
  }) {
    return Card(
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(description),
        ),
        leading: Icon(
          icon,
          size: 40,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
