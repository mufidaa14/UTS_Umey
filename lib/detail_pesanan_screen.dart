import 'package:flutter/material.dart';

class DetailPesananScreen extends StatelessWidget {
  const DetailPesananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Detail Pesanan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFFC0CB), // Soft pink
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            
            // Nama Customer
            _buildLabel('Nama Customer'),
            _buildTextField('Masukkan Nama Customer'),
            const SizedBox(height: 24),

            // Ukuran
            _buildLabel('Ukuran'),
            _buildTextField('Masukkan Ukuran'),
            const SizedBox(height: 24),

            // Qty
            _buildLabel('Qty'),
            _buildTextField('Masukkan Jumlah Pesanan'),
            const SizedBox(height: 24),

            // Tenggat
            _buildLabel('Tenggat'),
            _buildTextField('Masukkan Tenggat Pemesanan'),
            const SizedBox(height: 60),

            // Check Out Button
            Center(
              child: SizedBox(
                height: 45,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement Checkout Action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300], // Light grey button
                    foregroundColor: Colors.black, // Text color
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Chek Out', // Matching the reference image text exactly
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400]),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        isDense: true,
      ),
    );
  }
}
