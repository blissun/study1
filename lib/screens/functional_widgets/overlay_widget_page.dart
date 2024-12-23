import 'package:flutter/material.dart';

class OverlayWidgetPage extends StatefulWidget {
  const OverlayWidgetPage({super.key});

  @override
  State<OverlayWidgetPage> createState() => _OverlayWidgetPageState();
}

class _OverlayWidgetPageState extends State<OverlayWidgetPage> {
  OverlayEntry? _overlayEntry;
  OverlayEntry? _tooltipOverlay;
  bool _isLoading = false;

  @override
  void dispose() {
    _removeOverlay();
    _removeTooltip();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _removeTooltip() {
    _tooltipOverlay?.remove();
    _tooltipOverlay = null;
  }

  void _showLoadingOverlay() {
    _removeOverlay();

    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black26,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('로딩 중...'),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
    setState(() => _isLoading = true);

    // 3초 후에 로딩 오버레이 제거
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _removeOverlay();
        setState(() => _isLoading = false);
      }
    });
  }

  void _showTooltip(BuildContext context, GlobalKey key) {
    _removeTooltip();

    final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    _tooltipOverlay = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + renderBox.size.height + 5,
        left: offset.dx,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              '이것은 커스텀 툴팁입니다!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_tooltipOverlay!);

    // 3초 후에 툴팁 제거
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _removeTooltip();
      }
    });
  }

  final _tooltipKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay 위젯'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overlay 위젯의 특징:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('• 화면 최상단에 위젯을 표시'),
                    Text('• 로딩 인디케이터, 툴팁 등에 사용'),
                    Text('• Stack과 유사하지만 전체 앱 범위에서 동작'),
                    Text('• Navigator와 독립적으로 동작'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '1. 로딩 오버레이 예제',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _isLoading ? null : _showLoadingOverlay,
              child: const Text('로딩 오버레이 표시'),
            ),
            const SizedBox(height: 24),
            const Text(
              '2. 커스텀 툴팁 예제',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Center(
              child: GestureDetector(
                key: _tooltipKey,
                onTap: () => _showTooltip(context, _tooltipKey),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text('여기를 탭하여 툴팁 표시'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
