import 'package:flutter/material.dart';
import 'package:uts_umey/home_screen.dart';
import 'package:uts_umey/order_data.dart';


class DetailPesananScreen extends StatefulWidget {
  final String productName;
  const DetailPesananScreen({super.key, required this.productName});

  @override
  State<DetailPesananScreen> createState() => _DetailPesananScreenState();
}

class _DetailPesananScreenState extends State<DetailPesananScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Detail Pesanan',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Lengkapi Pesanan',
                style: TextStyle(
                  fontSize: 20, // Reduced from 24
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 6), // Reduced from 8
            const Center(
              child: Text(
                'Isi detail pesanan pelanggan di bawah ini.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13, // Reduced from 16
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 24), // Reduced from 40

            // Nama Customer
            _buildModernTextField(
              controller: _nameController,
              label: 'Nama Customer',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16), // Reduced from 20

            // Ukuran
            _buildModernTextField(
              controller: _sizeController,
              label: 'Ukuran',
              icon: Icons.format_size,
            ),
            const SizedBox(height: 16), // Reduced from 20

            // Qty
            _buildModernTextField(
              controller: _qtyController,
              label: 'Jumlah (Qty)',
              icon: Icons.shopping_bag_outlined,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16), // Reduced from 20

            // Tenggat
            _buildModernTextField(
              controller: _deadlineController,
              label: 'Tenggat Pemesanan',
              icon: Icons.calendar_today_outlined,
            ),
            const SizedBox(height: 40), // Reduced from 60

            // Check Out Button
            Container(
              width: double.infinity,
              height: 45, // Reduced from 55
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Reduced from 15
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE53935).withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isEmpty ||
                      _sizeController.text.isEmpty ||
                      _qtyController.text.isEmpty ||
                      _deadlineController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Harap isi semua kolom')),
                    );
                    return;
                  }

                  // Create new order
                  final newOrder = Order(
                    customerName: _nameController.text,
                    productName: widget.productName,
                    quantity: _qtyController.text,
                    size: _sizeController.text,
                    deadline: _deadlineController.text,
                    date: DateTime.now().toString().substring(0, 10),
                  );

                  // Add to global list
                  orderList.add(newOrder);

                  // Navigate to HomeScreen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen(initialIndex: 0)),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53935), // Red color
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Reduced from 15
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Check Out',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16, // Reduced from 18
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 14), // Smaller text input
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 13), // Smaller label
        floatingLabelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Reduced from 15
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black, width: 1.5), // Slightly thinner border
        ),
        prefixIcon: Icon(icon, size: 20), // Smaller Icon
        prefixIconColor: WidgetStateColor.resolveWith((states) =>
            states.contains(WidgetState.focused) ? Colors.black : Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Reduced padding
      ),
    );
  }
}
