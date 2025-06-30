import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final String username = "Iqbal Farhan";
  final String profileImage = "assets/profile.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),

        backgroundColor: const Color(0xFFFFF176),
        centerTitle: true,
        elevation: 4,
        title: Text(
          'FoundIt',
          style: GoogleFonts.orbitron(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFFFFDE7), // Light background
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFFFF176),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FoundIt Menu',
                    style: GoogleFonts.orbitron(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    username,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: Text('Home', style: GoogleFonts.poppins(color: Colors.black)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: Text('Profile', style: GoogleFonts.poppins(color: Colors.black)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Navigate to Profile Page")),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: Text('Settings', style: GoogleFonts.poppins(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search lost or found items...',
                hintStyle: GoogleFonts.poppins(color: Colors.black54),
                prefixIcon: const Icon(Icons.search, color: Colors.black87),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              style: GoogleFonts.poppins(color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _quickAction(
                  icon: Icons.search_off,
                  label: 'Report Lost',
                  color: Colors.pinkAccent,
                  onTap: () {},
                ),
                _quickAction(
                  icon: Icons.volunteer_activism,
                  label: 'Report Found',
                  color: Colors.lightGreen,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 30),

            Text(
              'Recent Reports',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  _itemCard("Black Wallet", "Lost near cafeteria", Colors.deepPurple),
                  _itemCard("iPhone 13", "Found in library", Colors.teal),
                  _itemCard("Car Keys", "Lost in parking lot", Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, size: 30, color: color),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemCard(String title, String subtitle, Color color) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.backpack, color: color),
        title: Text(title, style: GoogleFonts.poppins(color: Colors.black87)),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.poppins(color: Colors.black54, fontSize: 12),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: color),
        onTap: () {},
      ),
    );
  }
}
