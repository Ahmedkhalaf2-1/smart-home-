import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'room_page.dart';
import 'device_page.dart';
import 'lights_page.dart';
import 'ac_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName = "Ahmed";
    final List<_HomeItem> items = [
      _HomeItem(icon: Icons.meeting_room, label: 'Rooms', route: const RoomPage()),
      _HomeItem(icon: Icons.devices, label: 'Devices', route: const DevicePage(roomName: 'Living Room')),
      _HomeItem(icon: Icons.lightbulb_outline, label: 'Lights', route: const LightsPage()),
      _HomeItem(icon: Icons.ac_unit, label: 'AC', route: const ACPage()),
      _HomeItem(icon: Icons.settings, label: 'Settings', route: const SettingsPage()),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Welcome,',
                style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
              ),
              Text(
                userName.toUpperCase(),
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              const Text('Dashboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: items.map((item) => _DashboardCard(item: item)).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeItem {
  final IconData icon;
  final String label;
  final Widget? route;

  _HomeItem({required this.icon, required this.label, this.route});
}

class _DashboardCard extends StatelessWidget {
  final _HomeItem item;
  const _DashboardCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.route != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => item.route!),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(2, 2),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 40, color: Colors.black87),
            const SizedBox(height: 12),
            Text(
              item.label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
