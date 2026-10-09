import 'package:flutter/material.dart';

class AddRoomPage extends StatefulWidget {
  const AddRoomPage({super.key});

  @override
  State<AddRoomPage> createState() => _AddRoomPageState();
}

class _AddRoomPageState extends State<AddRoomPage> {
  final TextEditingController _roomNameController = TextEditingController();
  bool _isLoading = false;
  String? _message;

  void _submit() async {
    final roomName = _roomNameController.text.trim();

    if (roomName.isEmpty) {
      setState(() => _message = 'Please enter a room name');
      return;
    }

    setState(() {
      _isLoading = true;
      _message = null;
    });

    // هنا هيتربط بـ API لاحقًا
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
      _message = '✅ Room "$roomName" added successfully';
      _roomNameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Room')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _roomNameController,
              decoration: const InputDecoration(
                labelText: 'Room Name',
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
                  child: const Text('Add Room'),
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
