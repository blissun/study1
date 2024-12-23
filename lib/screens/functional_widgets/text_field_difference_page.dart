import 'package:flutter/material.dart';

class TextFieldDifferencePage extends StatefulWidget {
  const TextFieldDifferencePage({super.key});

  @override
  State<TextFieldDifferencePage> createState() =>
      _TextFieldDifferencePageState();
}

class _TextFieldDifferencePageState extends State<TextFieldDifferencePage> {
  final _formKey = GlobalKey<FormState>();
  final _textFormFieldController = TextEditingController();
  final _textFieldController = TextEditingController();
  String _formFieldValue = '';

  @override
  void dispose() {
    _textFormFieldController.dispose();
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField vs TextFormField'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                        '주요 차이점:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('1. TextField'),
                      Text('• 기본적인 텍스트 입력 위젯'),
                      Text('• Form 위젯과 통합되지 않음'),
                      Text('• 유효성 검사 기능이 내장되어 있지 않음'),
                      SizedBox(height: 8),
                      Text('2. TextFormField'),
                      Text('• Form 위젯과 통합됨'),
                      Text('• validator 기능 내장'),
                      Text('• save 기능을 통한 Form 데이터 저장 가능'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '1. TextField 예시:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '기본 TextField',
                  hintText: '여기에 입력하세요',
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              Text('입력된 값: ${_textFieldController.text}'),
              const SizedBox(height: 24),
              const Text(
                '2. TextFormField 예시:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'TextFormField',
                  hintText: '이메일을 입력하세요',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '값을 입력해주세요';
                  }
                  if (!value.contains('@')) {
                    return '올바른 이메일 형식이 아닙니다';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _formFieldValue = value;
                  });
                },
              ),
              Text('입력된 값: $_formFieldValue'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('유효성 검사 통과!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text('유효성 검사 실행'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
