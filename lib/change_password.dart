import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  bool _isLoading = false;
  String? _message;

  void _submit() async {
    final username = _usernameController.text.trim();
    final newPassword = _newPasswordController.text.trim();

    if (username.isEmpty || newPassword.isEmpty) {
      setState(() => _message = 'Please fill all fields');
      return;
    }

    setState(() {
      _isLoading = true;
      _message = null;
    });

    // هنا هيتربط بـ API حقيقية لاحقًا
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
      _message = '✅ Password changed for "$username"';
      _usernameController.clear();
      _newPasswordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'New Password',
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
                  onPressed: _submit,
                  child: const Text('Change Password'),
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
