import 'package:flutter/material.dart';
import 'ui_widgets/text_widget_page.dart';
import 'ui_widgets/rich_text_widget_page.dart';
import 'ui_widgets/scaffold_widget_page.dart';
import 'ui_widgets/container_widget_page.dart';
import 'ui_widgets/row_widget_page.dart';
import 'ui_widgets/column_widget_page.dart';
import 'ui_widgets/stack_widget_page.dart';
import 'ui_widgets/image_widget_page.dart';
import 'ui_widgets/scaffold/indexed_stack_navigation_page.dart';

class UIWidgetsPage extends StatelessWidget {
  const UIWidgetsPage({super.key});

  void _navigateToWidget(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI 위젯'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWidgetCard(
            'Text',
            '텍스트를 표시하는 기본적인 위젯',
            Icons.text_fields,
            context,
            const TextWidgetPage(),
          ),
          _buildWidgetCard(
            'RichText',
            '다양한 스타일을 적용할 수 있는 텍스트 위젯',
            Icons.format_size,
            context,
            const RichTextWidgetPage(),
          ),
          _buildWidgetCard(
            'Scaffold',
            '앱의 기본 레이아웃 구조를 제공하는 위젯',
            Icons.web_asset,
            context,
            const ScaffoldWidgetPage(),
          ),
          _buildWidgetCard(
            'Container',
            '패딩, 마진, 테두리 등을 설정할 수 있는 박스 위젯',
            Icons.check_box_outline_blank,
            context,
            const ContainerWidgetPage(),
          ),
          _buildWidgetCard(
            'Row',
            '위젯들을 가로로 배치하는 레이아웃 위젯',
            Icons.view_week,
            context,
            const RowWidgetPage(),
          ),
          _buildWidgetCard(
            'Column',
            '위젯들을 세로로 배치하는 레이아웃 위젯',
            Icons.view_agenda,
            context,
            const ColumnWidgetPage(),
          ),
          _buildWidgetCard(
            'Stack',
            '위젯들을 겹쳐서 배치할 수 있는 위젯',
            Icons.layers,
            context,
            const StackWidgetPage(),
          ),
          _buildWidgetCard(
            'Image',
            '이미지를 표시하는 위젯',
            Icons.image,
            context,
            const ImageWidgetPage(),
          ),
          _buildWidgetCard(
            'IndexedStack Navigation',
            'IndexedStack을 이용한 네비게이션 구현',
            Icons.swap_horiz,
            context,
            const IndexedStackNavigationPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetCard(
    String title,
    String description,
    IconData icon,
    BuildContext context,
    Widget page,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        onTap: () => _navigateToWidget(context, page),
      ),
    );
  }
}
