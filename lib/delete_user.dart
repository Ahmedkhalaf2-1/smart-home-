import 'package:flutter/material.dart';

class DeleteUserPage extends StatefulWidget {
  const DeleteUserPage({super.key});

  @override
  State<DeleteUserPage> createState() => _DeleteUserPageState();
}

class _DeleteUserPageState extends State<DeleteUserPage> {
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false;
  String? _message;

  void _submit() async {
    final username = _usernameController.text.trim();

    if (username.isEmpty) {
      setState(() => _message = 'Please enter a username');
      return;
    }

    setState(() {
      _isLoading = true;
      _message = null;
    });

    // هنا هيبقى طلب API حقيقي لاحقًا
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
      _message = '✅ User "$username" deleted successfully';
      _usernameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete User')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username to delete',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: _submit,
                  child: const Text('Delete User'),
                ),
              ),
            if (_message != null) ...[
              const SizedBox(height: 16),
              Text(_message!, style: const TextStyle(color: Colors.green)),
            ]
          ],
        ),
      ),
    );
  }
}
