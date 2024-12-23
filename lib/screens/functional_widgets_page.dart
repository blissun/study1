import 'package:flutter/material.dart';
import 'functional_widgets/gesture_detector_page.dart';
import 'functional_widgets/gesture_detector_behavior_page.dart';
import 'functional_widgets/ignore_pointer_page.dart';
import 'functional_widgets/list_view_page.dart';
import 'functional_widgets/text_field_page.dart';
import 'functional_widgets/animated_container_page.dart';
import 'functional_widgets/future_builder_page.dart';
import 'functional_widgets/text_field_difference_page.dart';
import 'functional_widgets/form_widget_page.dart';
import 'functional_widgets/overlay_widget_page.dart';

class FunctionalWidgetsPage extends StatelessWidget {
  const FunctionalWidgetsPage({super.key});

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
        title: const Text('기능 위젯'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWidgetCard(
            'GestureDetector',
            '터치 이벤트를 감지하고 처리하는 위젯',
            Icons.touch_app,
            context,
            const GestureDetectorPage(),
          ),
          _buildWidgetCard(
            'GestureDetector Behavior',
            'GestureDetector의 behavior 속성 이해하기',
            Icons.touch_app_outlined,
            context,
            const GestureDetectorBehaviorPage(),
          ),
          _buildWidgetCard(
            'IgnorePointer',
            '터치 이벤트를 무시하는 위젯',
            Icons.block,
            context,
            const IgnorePointerPage(),
          ),
          _buildWidgetCard(
            'ListView',
            '스크롤 가능한 목록을 만드는 위젯',
            Icons.list,
            context,
            const ListViewPage(),
          ),
          _buildWidgetCard(
            'TextField',
            '사용자 입력을 받는 위젯',
            Icons.edit,
            context,
            const TextFieldPage(),
          ),
          _buildWidgetCard(
            'AnimatedContainer',
            '애니메이션 효과를 주는 컨테이너 위젯',
            Icons.animation,
            context,
            const AnimatedContainerPage(),
          ),
          _buildWidgetCard(
            'FutureBuilder',
            '비동기 데이터를 처리하는 위젯',
            Icons.update,
            context,
            const FutureBuilderPage(),
          ),
          _buildWidgetCard(
            'TextField vs TextFormField',
            'TextField와 TextFormField의 차이점 이해하기',
            Icons.compare_arrows,
            context,
            const TextFieldDifferencePage(),
          ),
          _buildWidgetCard(
            'Form 위젯',
            'Form을 사용한 입력 양식 만들기',
            Icons.assignment,
            context,
            const FormWidgetPage(),
          ),
          _buildWidgetCard(
            'Overlay 위젯',
            '화면 최상단에 위젯 표시하기',
            Icons.layers,
            context,
            const OverlayWidgetPage(),
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
