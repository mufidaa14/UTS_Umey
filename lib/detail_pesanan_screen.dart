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
  final TextEditingController _qtyController = TextEditingController(text: '1');
  final TextEditingController _deadlineController = TextEditingController();

  // Primary Theme Color (Red/Pink from Login)
  final Color _themeColor = const Color(0xFFE53935);
  // Soft Pink for Backgrounds/Headers
  final Color _softPink = const Color(0xFFFFC0CB);

  // Helper to safely parse int from controller
  int get _currentQty => int.tryParse(_qtyController.text) ?? 1;

  void _incrementQty() {
    setState(() {
      int current = _currentQty;
      _qtyController.text = (current + 1).toString();
    });
  }

  void _decrementQty() {
    setState(() {
      int current = _currentQty;
      if (current > 1) {
        _qtyController.text = (current - 1).toString();
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: _softPink, // Soft Pink header
              onPrimary: Colors.black, // Text on header
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        // Format: dd/mm/yyyy
        _deadlineController.text =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

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
        backgroundColor: _softPink, // Soft Pink
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // Added top spacing as requested
            const Center(
              child: Text(
                'Lengkapi Pesanan',
                style: TextStyle(
                  fontSize: 20, // Increased as requested
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Center(
              child: Text(
                'Isi detail pesanan pelanggan di bawah ini.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11, // Small but readable
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Nama Customer
            _buildCardInput(
              child: _buildTextField(
                controller: _nameController,
                label: 'Nama Customer',
                icon: Icons.person_outline,
                hint: 'Masukkan Nama Customer',
              ),
            ),
            const SizedBox(height: 8),

            // Ukuran
            _buildCardInput(
              child: _buildTextField(
                controller: _sizeController,
                label: 'Ukuran',
                icon: Icons.format_size,
                hint: 'Masukkan Ukuran',
              ),
            ),
            const SizedBox(height: 8),

            // Qty (Stepper)
            _buildCardInput(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Row(
                children: [
                  const Icon(Icons.shopping_bag_outlined, color: Colors.grey, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jumlah Pesanan',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${_currentQty} pcs',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        _buildStepperButton(Icons.remove, _decrementQty),
                        Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: Text(
                            '$_currentQty',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _buildStepperButton(Icons.add, _incrementQty),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Tenggat (Date Picker)
            GestureDetector(
              onTap: () => _selectDate(context),
              child: _buildCardInput(
                child: AbsorbPointer(
                  child: _buildTextField(
                    controller: _deadlineController,
                    label: 'Tenggat Pemesanan',
                    icon: Icons.calendar_today_outlined,
                    hint: 'Pilih Tanggal',
                    isReadOnly: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Check Out Button
            Container(
              width: double.infinity,
              height: 45, // Reduced height for compact look
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: _themeColor.withOpacity(0.4),
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
                  backgroundColor: _themeColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Check Out',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardInput(
      {required Widget child, EdgeInsetsGeometry? padding}) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 0), // Very compact padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: child,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    bool isReadOnly = false,
  }) {
    return TextField(
      controller: controller,
      readOnly: isReadOnly,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500), // Smaller text
      cursorColor: _themeColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 12, // Smaller label
          fontWeight: FontWeight.w500,
        ),
        floatingLabelStyle: TextStyle(
          color: _themeColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        icon: Icon(icon, color: Colors.grey[400], size: 20),
        focusedBorder: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 10), // Reduced vertical padding
      ),
    );
  }


  Widget _buildStepperButton(IconData icon, VoidCallback onPressed) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          child: Icon(icon, size: 18, color: Colors.black87),
        ),
      ),
    );
  }
}
