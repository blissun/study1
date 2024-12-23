import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  String _inputText = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField 위젯'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('기본 TextField:'),
              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '기본 입력',
                  hintText: '텍스트를 입력하세요',
                ),
                onChanged: (value) {
                  setState(() {
                    _inputText = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              Text('입력된 텍스트: $_inputText'),
              const SizedBox(height: 16),
              const Text('비밀번호 TextField:'),
              const SizedBox(height: 8),
              TextField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: '비밀번호',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('유효성 검사가 있는 TextField:'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이메일',
                  hintText: 'example@email.com',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력해주세요';
                  }
                  if (!value.contains('@')) {
                    return '올바른 이메일 형식이 아닙니다';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('유효성 검사 통과!')),
                    );
                  }
                },
                child: const Text('유효성 검사'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
