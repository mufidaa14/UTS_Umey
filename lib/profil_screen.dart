import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFFC0CB), // Soft Pink
        elevation: 0,
        automaticallyImplyLeading: false, 
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Image Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              color: Colors.grey[300], // Light grey background
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent, 
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Identitas Section
                  _buildSectionHeader('Identitas'),
                  const SizedBox(height: 10),
                  _buildInfoItem('Nama Lengkap', 'Royhatul Jannatul Mufida', boldValue: true),
                  const SizedBox(height: 20),
                  _buildInfoItem('Jenis Kelamin', 'Perempuan'),
                  const SizedBox(height: 40),

                  // Kontak Section
                  _buildSectionHeader('Kontak'),
                  const SizedBox(height: 10),
                  _buildContactItem(Icons.email_outlined, 'Alamat Email', 'fdaate14@gmail.com'),
                  const SizedBox(height: 20),
                  _buildContactItem(Icons.phone_android, 'Handphone', '087********'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        const Divider(color: Colors.black, thickness: 1),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value, {bool boldValue = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: boldValue ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 30, color: Colors.black),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
