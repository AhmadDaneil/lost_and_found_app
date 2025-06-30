import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;
  double fontSize = 16.0;
  final TextEditingController telegramController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.orbitron(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFFFF176),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black), // Hamburger icon black
      ),
      backgroundColor: const Color(0xFFFFF9C4),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Appearance'),
          ListTile(
            leading: const Icon(Icons.text_fields, color: Colors.black),
            title: Text('Font Size', style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black)),
            subtitle: Slider(
              value: fontSize,
              min: 12,
              max: 24,
              divisions: 6,
              label: fontSize.round().toString(),
              onChanged: (newSize) {
                setState(() {
                  fontSize = newSize;
                });
              },
            ),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode, color: Colors.black),
            title: Text('Dark Mode', style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black)),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
              // Optional: implement theme switching logic
            },
          ),
          const SizedBox(height: 10),

          _buildSectionTitle('Notifications'),
          SwitchListTile(
            secondary: const Icon(Icons.notifications, color: Colors.black),
            title: Text('Enable Notifications', style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black)),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          const SizedBox(height: 10),

          _buildSectionTitle('Privacy'),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.black),
            title: Text('Link Telegram Account', style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black)),
            subtitle: TextField(
              controller: telegramController,
              style: GoogleFonts.poppins(color: Colors.black),
              decoration: const InputDecoration(
                hintText: '@yourTelegramUsername',
                hintStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(),
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                String username = telegramController.text.trim();
                if (username.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Telegram linked: $username')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: const Text('Link'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
