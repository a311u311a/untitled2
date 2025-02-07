import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القائمة'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('الإعدادات'),
            onTap: () {
              // الانتقال إلى صفحة الإعدادات
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('حول التطبيق'),
            onTap: () {
              // الانتقال إلى صفحة حول التطبيق
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('تسجيل الخروج'),
            onTap: () {
              // تسجيل الخروج
            },
          ),
        ],
      ),
    );
  }
}