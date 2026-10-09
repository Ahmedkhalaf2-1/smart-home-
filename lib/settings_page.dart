import 'package:flutter/material.dart';
import 'add_user.dart';
import 'delete_user.dart';
import 'add_room_page.dart';
import 'change_password.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SettingsItem> items = [
      _SettingsItem(
          icon: Icons.person_add,
          label: 'Add User',
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AddUserPage()))),
      _SettingsItem(
          icon: Icons.person_remove,
          label: 'Delete User',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const DeleteUserPage()))),
      _SettingsItem(
          icon: Icons.add_home,
          label: 'Add Room',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddRoomPage()))),
      _SettingsItem(
          icon: Icons.lock_reset,
          label: 'Change Password',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ChangePasswordPage()))),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(height: 24),
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: Icon(item.icon, size: 28),
              title: Text(item.label, style: const TextStyle(fontSize: 18)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: item.onTap,
            );
          },
        ),
      ),
    );
  }
}

class _SettingsItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  _SettingsItem({required this.icon, required this.label, required this.onTap});
}
